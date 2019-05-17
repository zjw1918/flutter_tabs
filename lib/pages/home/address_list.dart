import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellp/api/geo_api.dart';
import 'package:hellp/bean/address.dart';

class AddressList extends StatefulWidget {
  AddressList({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddressListState();
  }
}

class _AddressListState extends State<AddressList> with AutomaticKeepAliveClientMixin<AddressList> {
  List<Address> _list = [];

  @override
  void initState() {
    super.initState();
    print('init state addresslist');
  }

  void _setList(List<Address> list) {
    setState(() {
      _list = list;
    });
  }

//  Widget _buildList() {
//    return ListView.builder(
//      padding: const EdgeInsets.all(16.0),
//      itemCount: _list.length,
//      itemBuilder: (context, i) {
//        return _buildRow(_list[i]);
//      },
//    );
//  }

//  Widget _buildRow(Address address) {
//    return ListTile(
//      title: Text(address.toString()),
//    );
//  }

  void _onFetchPressed() async {
    try {
      var l = await fetchAddresses();
      _setList(l);
    } catch (e) {
      print(e);
    }
  }

  void _onClear() {
    _setList([]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('fetch'),
              onPressed: _onFetchPressed,
            ),
            RaisedButton(
              child: Text('clear'),
              onPressed: _onClear,
            ),
          ],
        ),
        Expanded(
          child: AddressesContainer(_list),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

}


// stateless list
class AddressesContainer extends StatelessWidget {
  final List<Address> _list;

  AddressesContainer(this._list);

  Widget _buildItem(context, i) {
    return Card(
      child: Column(
        children: <Widget>[
          Text('${_list[i].name}'),
          Text('${_list[i].address}'),
          Text('lat:${_list[i].latitude} long: ${_list[i].longitude}')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: _buildItem,
    );
  }
}