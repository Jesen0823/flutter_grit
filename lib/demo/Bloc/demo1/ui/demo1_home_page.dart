import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grit/demo/Bloc/demo1/cubit/count_cubit.dart';

class Demo1HomePage extends StatelessWidget {
  const Demo1HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CountCubit, CountInitial>(
            builder: (context, state) {
              return Text(state.countValue.toString(),style: TextStyle(color:Colors.green,fontSize: 36),);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildBtn(Icons.add_circle,
                  () => BlocProvider.of<CountCubit>(context).increment()),
              SizedBox(width: 20.0,),
              buildBtn(Icons.remove_circle,
                  () => BlocProvider.of<CountCubit>(context).decrement()),
            ],
          )
        ],
      ),
    );
  }

  Widget buildBtn(IconData icon, Function myFunction) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () => myFunction(),
          icon: Icon(icon,color: Colors.blue,size:48.0,),
        ),
      );
}
