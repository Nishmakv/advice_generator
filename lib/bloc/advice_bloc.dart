import 'package:advice_quote/models/advice_model.dart';
import 'package:advice_quote/network/base_result.dart';
import 'package:advice_quote/repo/advice_repo.dart';
import 'package:bloc/bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceState.initial()) {
    on<GetAdvice>(getAdvice);
  }

  final AdviceRepo adviceRepo = AdviceRepo();
  Future<void> getAdvice(
    GetAdvice event,
    Emitter<AdviceState> emit,
  ) async {
    emit(state.copyWith(status: AdviceStatus.fetching));
    try {
      final Result response = await adviceRepo.advice();
      if (response.success ?? false) {
        emit(state.copyWith(status: AdviceStatus.fetched,adviceData: response.data));
      } else {
        emit(state.copyWith(status: AdviceStatus.exception));
      }
    } catch (e) {
    
      emit(state.copyWith(status: AdviceStatus.exception));
    }
  }
}
