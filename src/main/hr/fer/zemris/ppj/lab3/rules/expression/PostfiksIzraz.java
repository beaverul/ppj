package hr.fer.zemris.ppj.lab3.rules.expression;

import java.util.Arrays;
import java.util.List;

import hr.fer.zemris.ppj.lab3.analyzer.SemanticException;
import hr.fer.zemris.ppj.lab3.rules.Rule;
import hr.fer.zemris.ppj.lab3.scope.Scope;
import hr.fer.zemris.ppj.lab3.types.Array;
import hr.fer.zemris.ppj.lab3.types.Int;
import hr.fer.zemris.ppj.lab3.types.NonVoidFunctionType;
import hr.fer.zemris.ppj.lab3.types.Type;
import hr.fer.zemris.ppj.lab3.types.TypesHelper;
import hr.fer.zemris.ppj.lab3.types.VoidFunctionType;
import hr.fer.zemris.ppj.node.SNode;
import hr.fer.zemris.ppj.symbol.NonTerminalSymbol;

/**
 * @author Herman Zvonimir Dosilovic
 */
public class PostfiksIzraz extends Rule {
  public static PostfiksIzraz POSTFIKS_IZRAZ = new PostfiksIzraz();

  private PostfiksIzraz() {
    super(new NonTerminalSymbol("<postfiks_izraz>"));
  }

  @Override
  public void checkRule(SNode node, Scope scope) throws SemanticException {
    List<String> children = node.getValuesOfChildren();
    if (children.equals(Arrays.asList("<primarni_izraz>"))) {
      SNode child = node.getChildren().get(0);

      // 1
      child.visit(scope);
      node.setType(child.getType());
      node.setlValue(child.islValue());

    } else if (children
        .equals(Arrays.asList("<postfiks_izraz>", "L_UGL_ZAGRADA", "<izraz>", "D_UGL_ZAGRADA"))) {
      SNode postfiks_izraz = node.getChildren().get(0);
      SNode izraz = node.getChildren().get(2);

      // 1
      postfiks_izraz.visit(scope);

      // 2
      if (!TypesHelper.isArray(postfiks_izraz.getType())) {
        throw new SemanticException(getErrorMessage(node));
      }

      // 3
      izraz.visit(scope);

      // 4
      if (!TypesHelper.canImplicitlyCast(izraz.getType(), Int.INT)) {
        throw new SemanticException(getErrorMessage(node));
      }

      Type X = ((Array) postfiks_izraz.getType()).getNumericType();
      node.setType(X);
      node.setlValue(!TypesHelper.isConstT(X));
    } else if (children.equals(Arrays.asList("<postfiks_izraz>", "L_ZAGRADA", "D_ZAGRADA"))) {
      SNode postfiks_izraz = node.getChildren().get(0);

      // 1
      postfiks_izraz.visit(scope);

      // 2
      Type pov = getFunctionTypeByName(scope, postfiks_izraz.getName());
      if (!(postfiks_izraz.getType() instanceof VoidFunctionType)) {
        throw new SemanticException(getErrorMessage(node));
      }

      node.setType(pov);
      node.setlValue(false);
    } else if (children.equals(
        Arrays.asList("<postfiks_izraz>", "L_ZAGRADA", "<lista_argumenata>", "D_ZAGRADA"))) {
      SNode postfiks_izraz = node.getChildren().get(0);
      SNode lista_argumenata = node.getChildren().get(2);

      // 1
      postfiks_izraz.visit(scope);

      // 2
      lista_argumenata.visit(scope);

      // 3
      Type pov = getFunctionTypeByName(scope, postfiks_izraz.getName());
      if (!(postfiks_izraz.getType() instanceof NonVoidFunctionType)) {
        throw new SemanticException(getErrorMessage(node));
      }

      List<Type> params = ((NonVoidFunctionType) postfiks_izraz.getType()).getParams();
      for (int i = 0; i < params.size(); i++) {
        if (!TypesHelper.canImplicitlyCast(lista_argumenata.getTypes().get(i), params.get(i))) {
          throw new SemanticException(getErrorMessage(node));
        }
      }

      node.setType(pov);
      node.setlValue(false);
    } else if (children.equals(Arrays.asList("<postfiks_izraz>", "OP_INC"))
        || children.equals(Arrays.asList("<postfiks_izraz>", "OP_DEC"))) {
      SNode postfiks_izraz = node.getChildren().get(0);

      // 1
      postfiks_izraz.visit(scope);

      // 2
      if (!postfiks_izraz.islValue()
          || !TypesHelper.canImplicitlyCast(postfiks_izraz.getType(), Int.INT)) {
        throw new SemanticException(getErrorMessage(node));
      }

      node.setType(Int.INT);
      node.setlValue(false);
    }
  }

  private Type getFunctionTypeByName(Scope scope, String name) {
    while(scope != null) {
      if (scope.hasDeclared(name)) {
        return scope.getType(name);
      }
      scope = scope.getParentScope();
    }
    return null;
  }
}