package hr.fer.zemris.ppj.lab3.rules.definitions;

import hr.fer.zemris.ppj.lab3.analyzer.SemanticException;
import hr.fer.zemris.ppj.lab3.rules.Rule;
import hr.fer.zemris.ppj.lab3.scope.Scope;
import hr.fer.zemris.ppj.lab3.types.Array;
import hr.fer.zemris.ppj.lab3.types.NumericType;
import hr.fer.zemris.ppj.lab3.types.Type;
import hr.fer.zemris.ppj.lab3.types.TypesHelper;
import hr.fer.zemris.ppj.node.SNode;
import hr.fer.zemris.ppj.symbol.NonTerminalSymbol;

import java.util.Arrays;
import java.util.List;

public class InitDeklarator extends Rule {
  public static InitDeklarator INIT_DEKLARATOR = new InitDeklarator();

  private InitDeklarator() {
    super(new NonTerminalSymbol("<init_deklarator>"));
  }

  @Override
  public void checkRule(SNode node, Scope scope) throws SemanticException {
    List<String> children = node.getValuesOfChildren();

    if (children.equals(Arrays.asList("<izravni_deklarator>"))) {
      SNode izravni_deklarator = node.getChildren().get(0);

      // 1
      izravni_deklarator.setnType(node.getnType());
      izravni_deklarator.visit(scope);

      // 2
      if (TypesHelper.isConstT(izravni_deklarator.getType())
          || TypesHelper.isArrayConstT(izravni_deklarator.getType())) {
        throw new SemanticException(getErrorMessage(node));
      }
    } else if (children.equals(Arrays.asList("<izravni_deklarator>", "OP_PRIDRUZI",
        "<inicijalizator>"))) {
      SNode izravni_deklarator = node.getChildren().get(0);
      // 1
      izravni_deklarator.setnType(node.getnType());
      izravni_deklarator.visit(scope);

      // 2
      SNode inicijalizator = node.getChildren().get(2);
      inicijalizator.visit(scope);

      // 3
      if (TypesHelper.isT(izravni_deklarator.getType())
          || TypesHelper.isConstT(izravni_deklarator.getType())) {
        if (!TypesHelper.canImplicitlyCast(inicijalizator.getType(),
            TypesHelper.getTFromX((NumericType) izravni_deklarator.getType()))) {
          throw new SemanticException(getErrorMessage(node));
        } else if ((TypesHelper.isArray(izravni_deklarator.getType()) || TypesHelper
            .isArrayConstT(izravni_deklarator.getType()))
            && inicijalizator.getElemCount() <= izravni_deklarator.getElemCount()) {

          for (Type U : inicijalizator.getTypes()) {
            if (!TypesHelper.canImplicitlyCast(U,
                TypesHelper.getTFromX(((Array) izravni_deklarator.getType()).getNumericType()))) {
              throw new SemanticException(getErrorMessage(node));
            }
          }
        } else {
          throw new SemanticException(getErrorMessage(node));
        }
      }

    }
  }
}
