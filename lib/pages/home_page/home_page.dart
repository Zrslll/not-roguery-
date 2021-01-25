import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notroguery/constants/constants.dart';
import 'package:notroguery/constants/localization.dart';
import 'package:notroguery/pages/home_page/home_bloc/home_bloc.dart';
import 'package:notroguery/widgets/exit_button.dart';
import 'package:notroguery/widgets/info_card.dart';
import 'package:notroguery/widgets/show_progress_indicator.dart';

class HomePage extends StatelessWidget {
  int _index = 0;

  void _displayDialog(context, title, text) => showDialog(
        context: context,
        child: AlertDialog(
          title: Text(title),
          content: Text(text),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()
        ..add(
          InitialHomeEvent(index: _index),
        ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is FailureHomeState)
            _displayDialog(
              context,
              Localization.an_error_occurred,
              state.error,
            );
        },
        builder: (context, state) => DefaultTabController(
          length: Constants.tabCategories.length,
          child: Scaffold(
            appBar: AppBar(
              actions: [ExitButton()],
              bottom: TabBar(
                  onTap: (val) {
                    _index = val;
                    return BlocProvider.of<HomeBloc>(context).add(
                      InitialHomeEvent(index: _index),
                    );
                  },
                  isScrollable: true,
                  tabs: Constants.tabCategories
                      .map(
                        (title) => Tab(text: title),
                      )
                      .toList()),
            ),
            body: (state is SuccessHomeState)
                ? TabBarView(
                    children: Constants.tabCategories
                        .map(
                          (e) => ListView.builder(
                            itemCount: state.cards.length,
                            itemBuilder: (context, index) => InfoCard(
                              text: state.cards[index].text,
                            ),
                          ),
                        )
                        .toList(),
                  )
                : ShowProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
