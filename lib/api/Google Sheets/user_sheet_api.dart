import 'package:gsheets/gsheets.dart';
import '../../services/Data/data_model.dart';

class UserSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "gsheets-386203",
  "private_key_id": "65d7d625d16ab82754c58ce9ffb08bc3055a399f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCjD7gwo+EtiXW+\nDmgPqY9ZfkwK2HIp2BpzXM16CVu9/VS6Jd5CgYejlkPCsSgKTk7qt9iJWyW8yWHl\nDD5G3vrzIrHJOuZAqPAI9FCNXdLd4P317H8UeZl05sw4Emb/Nhah+zPOwmXlaUWd\nG0mS1qY/Tq9w8oH+K0miJLyZXRNUrwTjvUwqaeYVaVNcFvWxYH4alAvrdXCtUuI3\nXNfpGf63Qe+Oh3BcY7tS7xzk7I6jbxibUniVGrpudGyWlWru1sBnod3cCOA7qD5B\ngZNMWD4eKizH+EpaUp4g+s7XmmdEi7YrWyiSldQFRYp4LdQ5bJpSsra3UpA5uXll\n2te08zhdAgMBAAECggEAJSj9rY4HUMiY/ddMJTebzMYQv878U2dlfcFaLVPJJcbA\nAo0DNg5NUj06E3oqeRDIAMslbIYKV1fgeKGd5qpFr9eKAyUqWHV3gF7nJZRKbBis\nX5lGC607iM3ZH/UnpkUWCtOTxqx8KrgfLnLLxUwoBljg+AE4GSuVw/8RwPSaZWuA\nn7vDl56H35vTYZcoV7WGGTuhWD3dFn/2fX/HJYWyTlbG3dm7QN0ZnyQ2kiV1PzZG\nzIF/rZ6GPMGxMvjWvZxahskbe1ZRsNyTGeA/qRma1fUop9vg+bwLcGf9pI5hytZm\n75CPexCNhsrPU12ylsKhwbeqoGV1E6W/8gmEC1vhGQKBgQDkqIk03qSonehVyxlr\nnd0lUJXCOn1KLBPWYBaX5fmkL/UU/Lz2fAMmTBUSrsxUwXKxwRaPnEBRW12NBsJD\np2yf0sNOT8K42c0nPFXXtl8juM9Fa/t5aGdAEbBG99vFyc7c1OgL6go5qbP94bew\n8MLJxhOtg4wDY2yGxbfn7EKu+QKBgQC2jzHSpk9BvbM0R+FqvtGv7YAjzdbWD9Nf\ng4Dgjhaf/YxDGpju+tUE1MUBMY2ZIn+qK/6AH/xw/09ry5f4v0pYnKhSt3nnwMa2\n8GhR8A0drWJvZD19oGkz3Dr2QB4ZJ/HqgkhcxD56HU7Tv5paPv8bNCfD7nYsfNix\npiHQAvgZhQKBgBIKpkDQrGdNhk52pvvRyegu0pIvsUEP90S78ixsDeWBjzHnuzUr\nlcgIysTdm+u4E8eot5H/PyfsMJZ3CQ7zf+Ogap6cNn4FWWWWIiPSFPGpnFka6w2q\nSjNI8gK3fdS+Vp8gAWsnPUVNeZE3pRnF9WicQ2M2dO6zgpWjth4LiztpAoGAZ6eY\nd22clMw8IxQpJm3gK07jsfCe6f4kWxgUpeunZwIUkMlaSl67crnIfev/5RIUgK/o\nGiGPOS2Nj7wSttcORI/2drjci70GVzrbUKLHH7GhsXOuAlWBRkPmaolvTYNDtY5x\nvdJjUvyvFEW3Q0R/npeXeIU+LfZZJ00X57631e0CgYB+/tQsZyKxukbmLzu6nmlI\ncHf1yUxO4kTgtFpLi8qOrGC4wazwu11OSvhzopd7A+5Ram/Lss8A4b4L0rDCrhSx\n/2UMIYwbIipu3UFHt6SPgx7YMJsHy1ALTipTZ+j/buoYh4OwZZaP7/DjlBkvBGBg\nOarF58QsP9vHyNUEc2WG5A==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-386203.iam.gserviceaccount.com",
  "client_id": "117821600852799280822",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-386203.iam.gserviceaccount.com"
} 
''';
  static final _spreadsheetId = '1cYM1BuixGPp5U_CLurY_i0tuyxzB_zWvU-yDetnpwTk';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _dataSheet;
  static Worksheet? _categoriesSheet;
  static var dataEntries;
  static List<dynamic>? listOfDataEntries;
  static List<dynamic>? reversed;

  static Future init() async {
    final spreadsheet =
        await _gsheets.spreadsheet(_spreadsheetId); //spreadsheet instance
    _dataSheet = spreadsheet.worksheetByTitle('Data'); //Data worksheet instance
    _categoriesSheet = spreadsheet
        .worksheetByTitle('Categories'); //Categories worksheet instance

    //get a list of all data entries
    dataEntries = await _dataSheet?.values.map.allRows();
    listOfDataEntries = dataEntries?.map(User.fromJson).toList();
    reversed = listOfDataEntries?.reversed.toList();
  }

  static Future update() async {
    dataEntries = await _dataSheet?.values.map.allRows();
    listOfDataEntries = await dataEntries?.map(User.fromJson).toList();
    reversed = listOfDataEntries?.reversed.toList();
  }

  static Future insert(List<String> data) async {
    await init();
    await _dataSheet!.values.appendRow(data);
    await update();
  }
}
