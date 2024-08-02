import 'package:qfinity/export.dart';

class EncryptHelper {
  static const _key = 'Qfinity8343691';
  static final Digest _md5 = Digest('MD5');

  static Uint8List _md5Hash(String value) {
    return _md5.process(utf8.encode(value));
  }

  static String encrypt(dynamic text) {
    if (text == null || text == '') return '';
    try {
      final aes = PaddedBlockCipher('AES/ECB/PKCS7')
        ..init(
          true,
          PaddedBlockCipherParameters(
            KeyParameter(_md5Hash(_key)),
            null,
          ),
        );
      final Uint8List input = utf8.encode(text.toString());
      final Uint8List output = aes.process(input);
      return base64.encode(output);
    } catch (e) {
      return '';
    }
  }

  static String decrypt(String encryptedText) {
    if (encryptedText == '') return '';
    try {
      final aes = PaddedBlockCipher('AES/ECB/PKCS7')
        ..init(
          false,
          PaddedBlockCipherParameters(
            KeyParameter(_md5Hash(_key)),
            null,
          ),
        );
      final Uint8List encryptedData = base64.decode(encryptedText);
      final Uint8List decryptedData = aes.process(encryptedData);
      return utf8.decode(decryptedData);
    } catch (e) {
      return '';
    }
  }
}
