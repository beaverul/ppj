package hr.fer.zemris.ppj.lab3.scope;

import hr.fer.zemris.ppj.lab3.types.Type;

import java.util.Map;

public class Scope {
  private Scope parentScope;
  private Map<String, ScopeValue> table;
  
  public Scope() {
    this(null);
  }
  
  public Scope(Scope parentScope) {
    this.parentScope = parentScope;
  }

  public Scope getParentScope() {
    return parentScope;
  }
  
  public boolean exists(String name) {
    if (table.containsKey(name)) {
      return false;
    } else {
      return true;
    }
  }

  public void insert(String name, Type type, boolean isDefined) {
    ScopeValue value = new ScopeValue(type, isDefined);
    table.put(name, value);
  }

  public Type returnType(String name) {
    if (table.containsKey(name)) {
      return table.get(name).type;
    }
    return null;
  }
  
  /**
   * Returns true if this scope has defined object with given name.
   * @param name name to check in scope definition
   * @return true if this scope has defined object with given name
   */
  public boolean hasDefined(String name) {
    if (table.containsKey(name)) {
      return table.get(name).defined;
    }
    return false;
  }

  public void define(String name, boolean isDefined) {
    if (table.containsKey(name)) {
      table.get(name).setDefined(isDefined);
    }
  }

  private class ScopeValue {
    private Type type;
    private boolean defined;

    private ScopeValue(Type type, boolean defined) {
      this.type = type;
      this.defined = defined;
    }

    public void setDefined(boolean defined) {
      this.defined = defined;
    }
  }
}
