part of 'advice_bloc.dart';

abstract class AdviceEvent {
  const AdviceEvent();
  List<Object?> get props => [];
}

class GetAdvice extends AdviceEvent {
  const GetAdvice();
  @override
  List<Object?> get props => [];
}
