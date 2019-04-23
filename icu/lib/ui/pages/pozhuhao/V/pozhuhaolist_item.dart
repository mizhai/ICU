import 'package:flutter/material.dart';
import 'package:icu/data/protocol/protocolModel.dart';
import 'package:icu/res/res_index.dart';
import 'package:icu/common/common_index.dart';
import 'package:icu/ui/widgets/widgets.dart';
import 'package:icu/ui/pages/pozhuhao/C/pozhuhaoList.dart';

class PozhuhaolistItem extends StatelessWidget {
  
  const PozhuhaolistItem(this.model,{Key key}) : super(key: key);
  final PozhuhaolistModel model;

  @override
  Widget build(BuildContext context) {
    print(model.catname);
    return InkWell(

      onTap: () {
        print('点击一下');
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new PozhuhaoListPage()));
      },

      child: Container(
        padding: EdgeInsets.only(left: 8,right: 8,top: 20,bottom: 0),
        color: DefaultColours.col_F6F,
        child: Headeritem(model),

      ),

    );
   
  }
}


class Headeritem extends StatefulWidget {
  const Headeritem(this.model,{Key key}) : super(key: key);
  final PozhuhaolistModel model;
  @override
  _HeaderitemState createState() => _HeaderitemState();
}

class _HeaderitemState extends State<Headeritem> {
  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [DefaultColours.col_FFF,DefaultColours.col_FFF]),
        borderRadius: BorderRadius.circular(4),
      ),

      child: Container(
        child: Column(

          children: <Widget>[

            Container(
              color: DefaultColours.col_FAF,
              padding: EdgeInsets.only(left: 14,top: 8,bottom: 8,right: 14),
              child: Row(
                
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.5),
                    child: Container(
                      width: 31,
                      height: 31,
                      color: Colors.red,
                      child: CachedNetworkImage(
                        // width: 31,
                        // height: 31,
                        fit: BoxFit.fill,
                        imageUrl: widget.model.thumb,
                        placeholder: (context, url) => new ProgressView(),
                        errorWidget: (context, url, error) => new Icon(Icons.error),
                      ),
                    ),
                  ),

                  new SizedBox(width: 10),
                  new Text(
                    widget.model.catname,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15
                    ),
                  ),

                  new Expanded(
                    flex: 1,
                    child: Text(
                      widget.model.createTime,
                      style: TextStyle(
                          color: Colors.black12,
                          fontSize: 15
                        ),
                      textAlign: TextAlign.right,
                    ),
                  )

                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width - 28,
              color: DefaultColours.col_FFF,
              padding: EdgeInsets.only(top: 20,bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.model.title,
                    style: TextStyle(
                      color: DefaultColours.col_333,
                      fontSize:17
                    )
                  ),


                  FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          color: Colors.red,
                        ),
                        SizedBox(width: 5),
                        Text('听一下')
                      ],
                      
                    ),

                    onPressed: () {
                      print('object');
                    },

                  )
                ],
               ),
            )
          ],
        ),
      )


    );
  }
}