import 'package:flutter/material.dart';
import 'package:flutter_app_restapi_ep1/api_service.dart';
import 'package:flutter_app_restapi_ep1/user.dart';

class ShowUserUI extends StatefulWidget {
  @override
  _ShowUserUIState createState() => _ShowUserUIState();
}

class _ShowUserUIState extends State<ShowUserUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Show All User',
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: getAllUser(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            //show list view
            return ListView.separated(
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.red,
                );

              },
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                return ListTile(
                  leading: Image.network(
                   'https://img.icons8.com/material/24/000000/settings--v3.png',
                    height: 50.0,
                  ),

                  title: Text(
                    snapshot.data[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  subtitle: Text(
                    snapshot.data[index].address.zipcode,
                  ),

                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.lightBlue,
                  ),
                );
            },
            );
          }else{
            // show Progess
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
