package hr.fer.zemris.ppj.lab3.rules.expression;

import java.util.List;
import java.util.Arrays;

import hr.fer.zemris.ppj.lab3.analyzer.SemanticException;
import hr.fer.zemris.ppj.lab3.rules.Rule;
import hr.fer.zemris.ppj.lab3.scope.Scope;
import hr.fer.zemris.ppj.lab3.types.Int;
import hr.fer.zemris.ppj.lab3.types.TypesHelper;
import hr.fer.zemris.ppj.node.SNode;
import hr.fer.zemris.ppj.symbol.NonTerminalSymbol;

/**
 * @author Herman Zvonimir Dosilovic
 */
public class AditivniIzraz extends Rule {
  public static AditivniIzraz ADITIVNI_IZRAZ = new AditivniIzraz();

  private AditivniIzraz() {
    super(new NonTerminalSymbol("<aditivni_izraz>"));
  }

  @Override
  public void checkRule(SNode node, Scope scope) throws SemanticException {
    List<String> children = node.getValuesOfChildren();
    if (children.equals(Arrays.asList("<multiplikativni_izraz>"))) {
      SNode multiplikativni_izraz = node.getChildren().get(0);
      multiplikativni_izraz.visit(scope);
      node.setType(multiplikativni_izraz.getType());
      node.setlValue(multiplikativni_izraz.islValue());
    } else if (children.equals(Arrays.asList("<aditivni_izraz>", "PLUS", "<multiplikativni_izraz>"))
        || children.equals(Arrays.asList("<aditivni_izraz>", "MINUS", "<multiplikativni_izraz>"))) {
      SNode aditivini_izraz = node.getChildren().get(0);
      SNode multiplikativni_izraz = node.getChildren().get(2);
      aditivini_izraz.visit(scope);
      if (!TypesHelper.canImplicitlyCast(aditivini_izraz.getType(), Int.INT)) {
        throw new SemanticException(getErrorMessage(node));
      }
      multiplikativni_izraz.visit(scope);
      if (!TypesHelper.canImplicitlyCast(multiplikativni_izraz.getType(), Int.INT)) {
        throw new SemanticException(getErrorMessage(node));
      }
      node.setType(Int.INT);
      node.setlValue(false);
    }
  }
}
