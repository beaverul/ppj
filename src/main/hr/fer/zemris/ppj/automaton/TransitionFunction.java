package hr.fer.zemris.ppj.automaton;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import hr.fer.zemris.ppj.Pair;

/**
 * @author Herman Zvonimir Dosilovic
 *
 * @param <S> source/destination
 * @param <C> input symbol
 */
public class TransitionFunction<S, C> {

  private Map<Pair<S, C>, Collection<S>> transitionTable;
  private Map<S, Collection<S>> epsilonTransitionTable;

  public TransitionFunction() {
    this.transitionTable = new HashMap<>();
    this.epsilonTransitionTable = new HashMap<>();
  }

  public boolean addTransition(S source, C input, S destination) {
    Pair<S, C> pair = new Pair<>(source, input);
    if (!transitionTable.containsKey(pair)) {
      transitionTable.put(pair, new HashSet<>());
    }
    return transitionTable.get(pair).add(destination);
  }
  
  public boolean addEpsilonTransition(S source, S destination) {
    if (!epsilonTransitionTable.containsKey(source)) {
      epsilonTransitionTable.put(source, new HashSet<>());
    }
    return epsilonTransitionTable.get(source).add(destination);
  }

  public Collection<S> getTransitionResult(S source, C input) {
    Pair<S, C> pair = new Pair<>(source, input);
    if (!transitionTable.containsKey(pair)) {
      return new HashSet<>();
    }
    return transitionTable.get(pair);
  }
  
  public Collection<S> getEpsilonTransitionResult(S source) {
    if (!epsilonTransitionTable.containsKey(source)) {
      return new HashSet<>();
    }
    return epsilonTransitionTable.get(source);
  }

  public boolean existsTransition(S source, C input) {
    return !getTransitionResult(source, input).isEmpty();
  }

  public boolean existsEpsilonTransition(S source, S destination) {
    return getEpsilonTransitionResult(source).contains(destination);
  }
}
