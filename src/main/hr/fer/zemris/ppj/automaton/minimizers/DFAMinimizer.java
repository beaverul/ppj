package hr.fer.zemris.ppj.automaton.minimizers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import hr.fer.zemris.ppj.Pair;
import hr.fer.zemris.ppj.automaton.Automaton;
import hr.fer.zemris.ppj.automaton.TransitionFunction;

/**
 * @author Herman Zvonimir Dosilovic
 */
public final class DFAMinimizer {

  private DFAMinimizer() {}

  public static <S, C> Automaton<S, C> minimize(Automaton<S, C> automaton) {
    Automaton<S, C> minAutomaton = removeUnreachableStates(automaton);

    return minAutomaton;
  }

  static <S, C> Automaton<S, C> removeUnreachableStates(Automaton<S, C> automaton) {
    TransitionFunction<S, C> transitionFunction =
        automaton.getTransitionFunction().remove(automaton.getUnreachableStates());
    Set<S> states = automaton.getReachableStates();
    S initialState = automaton.getInitialState();

    Set<S> acceptableStates = new HashSet<>(automaton.getAcceptableStates());
    acceptableStates.removeAll(automaton.getUnreachableStates());

    return new Automaton<>(states, automaton.getAlphabet(), transitionFunction, initialState,
        acceptableStates);
  }

  static <S, C> Set<Pair<S, S>> getUnequalStates(Automaton<S, C> automaton) {
    return getUnequalStatesByAdvancement(automaton);
  }

  static <S, C> Set<Pair<S, S>> getUnequalStatesByAdvancement(Automaton<S, C> automaton) {
    Set<Pair<S, S>> unequalStates = getUnequalStatesByIdentity(automaton);

    Set<S> states = automaton.getStates();
    Set<C> alphabet = automaton.getAlphabet();
    TransitionFunction<S, C> transitionFunction = automaton.getTransitionFunction();
    Map<Pair<S, S>, Set<Pair<S, S>>> dependencyTable = new HashMap<>();
    for (S first : states) {
      for (S second : states) {
        Pair<S, S> pair = new Pair<>(first, second);
        Pair<S, S> reversedPair = new Pair<>(second, first);

        if (unequalStates.contains(pair) || unequalStates.contains(reversedPair)
            || first.equals(second)) {
          continue;
        }

        if (statesCanMarkedAsUnequal(first, second, transitionFunction, alphabet, unequalStates)) {
          unequalStates.add(new Pair<>(first, second));
          unequalStates.add(new Pair<>(second, first));
          markDependenciesAsUnequal(first, second, unequalStates, dependencyTable);
          markDependenciesAsUnequal(second, first, unequalStates, dependencyTable);
        } else {
          addToDependencyTable(first, second, dependencyTable, transitionFunction, alphabet);
          addToDependencyTable(second, first, dependencyTable, transitionFunction, alphabet);
        }
      }
    }
    return unequalStates;
  }

  static <S, C> Set<Pair<S, S>> getUnequalStatesByIdentity(Automaton<S, C> automaton) {
    Set<Pair<S, S>> unequalByMatchingRequirement = new HashSet<>();
    Set<S> states = automaton.getStates();
    for (S first : states) {
      for (S second : states) {
        if (automaton.hasAcceptableState(first) != automaton.hasAcceptableState(second)) {
          unequalByMatchingRequirement.add(new Pair<>(first, second));
          unequalByMatchingRequirement.add(new Pair<>(second, first));
        }
      }
    }
    return unequalByMatchingRequirement;
  }

  static <S, C> boolean statesCanMarkedAsUnequal(S first, S second,
      TransitionFunction<S, C> transitionFunction, Set<C> alphabet, Set<Pair<S, S>> unequalStates) {
    for (C symbol : alphabet) {
      if (!transitionFunction.existsTransition(first, symbol)
          || !transitionFunction.existsTransition(second, symbol)) {
        continue;
      }

      S nextFirst = new ArrayList<>(transitionFunction.getTransitionResult(first, symbol)).get(0);
      S nextSecond = new ArrayList<>(transitionFunction.getTransitionResult(second, symbol)).get(0);
      if (unequalStates.contains(new Pair<>(nextFirst, nextSecond))
          && unequalStates.contains(new Pair<>(nextSecond, nextFirst))) {
        return true;
      }
    }
    return false;
  }

  static <S> void markDependenciesAsUnequal(S first, S second, Set<Pair<S, S>> unequalStates,
      Map<Pair<S, S>, Set<Pair<S, S>>> dependencyTable) {
    Pair<S, S> pair = new Pair<>(first, second);
    if (!dependencyTable.containsKey(pair)) {
      return;
    }
    for (Pair<S, S> dependencyPair : dependencyTable.get(pair)) {
      unequalStates.add(dependencyPair);
      markDependenciesAsUnequal(dependencyPair.getFirst(), dependencyPair.getSecond(),
          unequalStates, dependencyTable);
    }
  }

  static <S, C> void addToDependencyTable(S first, S second,
      Map<Pair<S, S>, Set<Pair<S, S>>> dependencyTable, TransitionFunction<S, C> transitionFunction,
      Set<C> alphabet) {
    Pair<S, S> pair = new Pair<>(first, second);
    for (C symbol : alphabet) {
      if (!transitionFunction.existsTransition(first, symbol)
          || !transitionFunction.existsTransition(second, symbol)) {
        continue;
      }

      S nextFirst = new ArrayList<>(transitionFunction.getTransitionResult(first, symbol)).get(0);
      S nextSecond = new ArrayList<>(transitionFunction.getTransitionResult(second, symbol)).get(0);
      if (!nextFirst.equals(nextSecond)) {
        Pair<S, S> nextPair = new Pair<>(nextFirst, nextSecond);
        if (!dependencyTable.containsKey(nextPair)) {
          dependencyTable.put(nextPair, new HashSet<>());
        }
        dependencyTable.get(nextPair).add(pair);
      }
    }
  }
}
