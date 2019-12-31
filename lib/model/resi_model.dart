import 'dart:convert';
import 'package:http/http.dart' as http;

class Resi {
  String courierCode,
      courierName,
      waybillNumber,
      serviceCode,
      waybillDate,
      shipperName,
      receiverName,
      origin,
      destination,
      status,

      // DETAILS
      waybillTime,
      receiverAddress1,
      receiverAddress2;

  List manifest;

  Resi(
      {this.courierCode,
      this.courierName,
      this.waybillNumber,
      this.serviceCode,
      this.waybillDate,
      this.shipperName,
      this.receiverName,
      this.origin,
      this.destination,
      this.waybillTime,
      this.receiverAddress1,
      this.receiverAddress2,
      this.manifest,
      this.status});

  factory Resi.createDataResi(Map<String, dynamic> object) {
    return Resi(
        courierCode: object['summary']["courier_code"],
        courierName: object['summary']["courier_name"],
        waybillNumber: object['summary']["waybill_number"],
        serviceCode: object['summary']["service_code"],
        waybillDate: object['summary']["waybill_date"],
        shipperName: object['summary']["shipper_name"],
        receiverName: object['summary']["receiver_name"],
        origin: object['summary']["origin"],
        destination: object['summary']["destination"],
        status: object['summary']["status"],
        waybillTime: object['details']["waybill_time"],
        receiverAddress1: object['details']["receiver_address1"],
        receiverAddress2: object['details']["receiver_address2"],
        manifest: object['manifest']);
  }

  static Future<Resi> getUserFromApi(String kode, String courirCode) async {
    String apiUrl = "https://ongkir.matik.id/waybill";
    var apiResult = await http.post(apiUrl,
        body: {"waybill": kode, "courierCode": courirCode});

    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['results'];

    return Resi.createDataResi(userData);
  }
}

class UninilizedResi extends Resi {}
