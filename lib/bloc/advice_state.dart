part of 'advice_bloc.dart';

enum AdviceStatus {
  initial,
  fetched,
  fetching,
  loading,
  exception;
  
}

class AdviceState {
  final AdviceStatus status;
  final AdviceModel? adviceData;

  AdviceState({
    required this.status,
    this.adviceData,
  });

  factory AdviceState.initial() {
    return AdviceState(status: AdviceStatus.initial);
  }

  AdviceState copyWith({
    required AdviceStatus status,
    AdviceModel? adviceData,
  }) {
    return AdviceState(
      status: status,
      adviceData: adviceData ?? this.adviceData,
    );
  }
}
