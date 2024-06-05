import 'package:advice_quote/bloc/advice_bloc.dart';
import 'package:advice_quote/widgets/dice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    AdviceBloc adviceBloc = context.read<AdviceBloc>();
    adviceBloc.add(const GetAdvice());
    return BlocConsumer<AdviceBloc, AdviceState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff202632),
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color(0xff313a49),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: state.status == AdviceStatus.fetching
                            ? const Center(
                                child: Text(
                                'No data, please wait',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                            : Column(
                                children: [
                                  if (state.adviceData != null)
                                    Text(
                                      'Advice #${state.adviceData!.id}',
                                      style: const TextStyle(
                                        color: Color(0xff419d7d),
                                        fontSize: 12,
                                      ),
                                    ),
                                  const SizedBox(height: 15),
                                  if (state.adviceData != null)
                                    Text(
                                      state.adviceData!.advice,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  const SizedBox(height: 15),
                                  SvgPicture.asset(
                                      'assets/images/pattern-divider-mobile.svg'),
                                  const SizedBox(height: 20),
                                ],
                              ),
                      ),
                    ),
                    Positioned(
                      left: (screenWidth - 50) / 2,
                      bottom: -25,
                      child: GestureDetector(
                        onTap: () {
                          context.read<AdviceBloc>().add(const GetAdvice());
                        },
                        child: const DiceWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          );
        });
  }
}
