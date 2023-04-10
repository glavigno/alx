import 'package:alx_technical_test/blocs/characters_bloc_states.dart';

class DashboardPageViewModel {
  LoadedState state;

  DashboardPageViewModel(this.state);

  String get countStatistics {
    return '${state.data.length} fetched';
  }

  String get genderStatistics {
    final maleCount = state.data.where((c) => c.gender == 'Male').length;
    final femaleCount = state.data.where((c) => c.gender == 'Female').length;
    final otherCount = state.data.where((c) => c.gender == 'n/a' || c.gender == 'none').length;

    return '$maleCount M / $femaleCount F / $otherCount O';
  }

  String get hairColorStatistics {
    final counts = state.data.fold<Map<String, int>>(
      {},
      (map, c) {
        final key = c.hairColor ?? 'Unknown';
        map.update(key, (value) => value + 1, ifAbsent: () => 1);
        return map;
      },
    );
    final hairColorDistribution = counts.entries.map((entry) {
      final percentage = entry.value / state.data.length * 100;
      return '${entry.key}: ${percentage.toStringAsFixed(1)}%';
    }).join('\n');

    return hairColorDistribution;
  }
}
