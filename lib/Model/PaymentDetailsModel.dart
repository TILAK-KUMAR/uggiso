class PaymentDetailsModel {
  int? statusCode;
  String? message;
  Payload? payload;
  String? timeStamp;
  String? error;


  PaymentDetailsModel(
      {this.statusCode, this.message, this.payload, this.timeStamp});

  PaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['timeStamp'] = this.timeStamp;
    return data;
  }
  PaymentDetailsModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Payload {
  String? paymentId;
  String? orderId;
  String? receiverId;
  String? senderId;
  Null? payerName;
  Null? payerEmail;
  Null? payerMobile;
  Null? clientTxnId;
  Null? clientCode;
  double? amount;
  Null? paidAmount;
  Null? paymentMode;
  Null? amountType;
  String? status;
  String? statusCode;
  Null? responseCode;
  Null? sabpaisaTxnId;
  Null? bankName;
  Null? bankMessage;
  Null? bankTxnId;
  Null? sabpaisaErrorCode;
  Null? transDate;
  Null? refundStatusCode;
  Null? bankErrorCode;
  String? transactionId;
  Null? chargeBackStatus;
  Null? settlementStatus;
  String? createdDateTime;

  Payload(
      {this.paymentId,
        this.orderId,
        this.receiverId,
        this.senderId,
        this.payerName,
        this.payerEmail,
        this.payerMobile,
        this.clientTxnId,
        this.clientCode,
        this.amount,
        this.paidAmount,
        this.paymentMode,
        this.amountType,
        this.status,
        this.statusCode,
        this.responseCode,
        this.sabpaisaTxnId,
        this.bankName,
        this.bankMessage,
        this.bankTxnId,
        this.sabpaisaErrorCode,
        this.transDate,
        this.refundStatusCode,
        this.bankErrorCode,
        this.transactionId,
        this.chargeBackStatus,
        this.settlementStatus,
        this.createdDateTime});

  Payload.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    orderId = json['orderId'];
    receiverId = json['receiverId'];
    senderId = json['senderId'];
    payerName = json['payerName'];
    payerEmail = json['payerEmail'];
    payerMobile = json['payerMobile'];
    clientTxnId = json['clientTxnId'];
    clientCode = json['clientCode'];
    amount = json['amount'];
    paidAmount = json['paidAmount'];
    paymentMode = json['paymentMode'];
    amountType = json['amountType'];
    status = json['status'];
    statusCode = json['statusCode'];
    responseCode = json['responseCode'];
    sabpaisaTxnId = json['sabpaisaTxnId'];
    bankName = json['bankName'];
    bankMessage = json['bankMessage'];
    bankTxnId = json['bankTxnId'];
    sabpaisaErrorCode = json['sabpaisaErrorCode'];
    transDate = json['transDate'];
    refundStatusCode = json['refundStatusCode'];
    bankErrorCode = json['bankErrorCode'];
    transactionId = json['transactionId'];
    chargeBackStatus = json['chargeBackStatus'];
    settlementStatus = json['settlementStatus'];
    createdDateTime = json['createdDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentId'] = this.paymentId;
    data['orderId'] = this.orderId;
    data['receiverId'] = this.receiverId;
    data['senderId'] = this.senderId;
    data['payerName'] = this.payerName;
    data['payerEmail'] = this.payerEmail;
    data['payerMobile'] = this.payerMobile;
    data['clientTxnId'] = this.clientTxnId;
    data['clientCode'] = this.clientCode;
    data['amount'] = this.amount;
    data['paidAmount'] = this.paidAmount;
    data['paymentMode'] = this.paymentMode;
    data['amountType'] = this.amountType;
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['responseCode'] = this.responseCode;
    data['sabpaisaTxnId'] = this.sabpaisaTxnId;
    data['bankName'] = this.bankName;
    data['bankMessage'] = this.bankMessage;
    data['bankTxnId'] = this.bankTxnId;
    data['sabpaisaErrorCode'] = this.sabpaisaErrorCode;
    data['transDate'] = this.transDate;
    data['refundStatusCode'] = this.refundStatusCode;
    data['bankErrorCode'] = this.bankErrorCode;
    data['transactionId'] = this.transactionId;
    data['chargeBackStatus'] = this.chargeBackStatus;
    data['settlementStatus'] = this.settlementStatus;
    data['createdDateTime'] = this.createdDateTime;
    return data;
  }
}
