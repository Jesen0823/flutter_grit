import 'package:bloc_use_demo/bloc/show_data_bloc.dart';
import 'package:bloc_use_demo/models/data_mo_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShowDataBloc, ShowDataState>(
          builder: (context, state) {
            if (state is ShowDataInitialState) {
              context.read<ShowDataBloc>().add(LoadShowDataEvent());
              return const Center(child: CircularProgressIndicator(),);
            } else if (state is ShowDataLoadingState) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (state is ShowDataLoadedState) {
              return buildContentWidget(state.apiResult);
            }
            return Text('加载失败!');
          },
        ),

    );
  }

  Widget buildContentWidget(List<DataMoShowapiResBodyContentlist> apiResult) {
    return ListView.builder(
        padding: EdgeInsets.all(4),
        itemCount: apiResult.length,
        itemBuilder: (BuildContext context, int index) {
          final DataMoShowapiResBodyContentlist mode = apiResult[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        height: 230,
                        width: MediaQuery.of(context).size.width / 1.05,
                        fit: BoxFit.cover,
                        image: NetworkImage(mode.img!),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: GlassmorphicContainer(
                        width: MediaQuery.of(context).size.width / 1.05,
                        height: 120,
                        border: 0,
                        borderRadius: 6,
                        blur: 26,
                        alignment: Alignment.bottomCenter,
                        linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xffffffff).withOpacity(0.1),
                            const Color(0xa8bf2f56).withOpacity(0.05),
                          ],
                          stops: const [0.2, 1],
                        ),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xffffffff).withOpacity(0.1),
                            const Color(0xfddfefad).withOpacity(0.05),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  mode.title!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "日期：" + mode.ct!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
