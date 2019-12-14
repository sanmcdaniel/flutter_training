import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_flutter_krungsri/src/bloc/authen/authen_event.dart';
import 'package:training_flutter_krungsri/src/bloc/authen/bloc.dart';
import 'package:training_flutter_krungsri/src/global_variable.dart';
import 'package:training_flutter_krungsri/src/models/youtube_response.dart';
import 'package:training_flutter_krungsri/src/services/auth_service.dart';
import 'package:training_flutter_krungsri/src/services/network_service.dart';
import 'package:training_flutter_krungsri/src/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  StreamController<int> countStream =
      StreamController(); //store ANY type if don't specify
  var count = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    countStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [buildSliverAppBar(context)];
        },
        body: buildBodyListView(),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: () => NetworkService().sendTestJSON(),
        onPressed: () {
          countStream.sink.add(++count);
        },
        tooltip: 'Reset Navigation Index',
        child: Icon(Icons.add), //Change Icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, //Change for different locations
    );
  }

  buildBodyListView() {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
        setState(() {});
      },
      child: FutureBuilder(
        future: NetworkService().getYoutube(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Youtube> youTubeItems = snapshot.data;
            return buildListView(youTubeItems);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      //snap: true,
      //pinned: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Emerald Splash!'),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Image.network(
          'https://image.businessinsider.com/55c3bad1dd0895225c8b471a?width=1100&format=jpeg&auto=webp',
          fit: BoxFit.cover,
        ),
      ),
      title: Text('Jojo`s Bizarre Adventure'),
      actions: <Widget>[
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Constant.FAVORITE_ROUTE);
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.all(2),
                constraints: BoxConstraints(
                  minHeight: 16.0,
                  minWidth: 16.0,
                ),
//                height: 15.0,
//                width: 15.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: Center(
                    child: StreamBuilder(
                        stream: countStream.stream,
                        initialData: 0,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data.toString(),
                            style: TextStyle(fontSize: 7.5),
                          );
                        })),
              ),
              top: 11.0,
              right: 11.0,
            )
          ],
        ),
        IconButton(
          onPressed: () async {
            //showConfirmLogoutPopup();
            BlocProvider.of<AuthenBloc>(context).add(Logout());
          },
          icon: Icon(Icons.exit_to_app),
        )
      ],
    );
  }

  ListView buildListView(List<Youtube> youTubeItems) {
    return ListView.builder(
      padding: EdgeInsets.only(
        top: 6.0,
        bottom: 50.0,
      ),
      itemBuilder: (context, index) {
        final item = youTubeItems[index];
        return Card(
          margin: EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 12.0,
          ),
          child: Column(
            children: <Widget>[
              buildCardHeader(item),
              buildCardBody(item),
              buildCardFooter(),
            ],
          ),
        );
      },
      itemCount: youTubeItems.length,
    );
  }

  Row buildCardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.thumb_up),
          label: Text('Like'),
        ),
        SizedBox(
          width: 12.0,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.share),
          label: Text('Share'),
        ),
      ],
    );
  }

  buildCardBody(Youtube item) {
    return GestureDetector(
      onTap: () {
        //deeplink
        _launchURL(youtubeId: item.id);
      },
      child: Image.network(
        item.youtubeImage,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  ListTile buildCardHeader(Youtube item) {
    return ListTile(
      title: buildHeaderText(item.title),
      subtitle: buildHeaderText(item.subtitle),
      leading: GestureDetector(
        onTap: () async {
          try {
            final platform = const MethodChannel("native_call");
            await platform.invokeMethod('show_view', "sanMcDaniel");
          } on PlatformException catch (e) {
            print(e.message);
          }
        },
        child: CircleAvatar(
          backgroundImage: NetworkImage(item.avatarImage),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          GlobalVariable.favoriteItem.add(item);
        },
        icon: Icon(Icons.favorite_border),
      ),
    );
  }

  buildHeaderText(String text) => Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  _launchURL({String youtubeId}) async {
    //use url Launcher plugin
    var url = 'youtube://www.youtube.com/watch?v=$youtubeId';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      url = 'https://www.youtube.com/watch?v=$youtubeId';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  void showConfirmLogoutPopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Come back soon!'),
          content: Text('Are you sure you want to Log out?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () async {
                await AuthService().logout();
                Navigator.pushNamedAndRemoveUntil(context, Constant.LOGIN_ROUTE,
                    (Route<dynamic> route) => false);
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
