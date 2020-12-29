import Foundation
import UIKit

struct DecodeJSONFile {
    
    func decodeJSONFile(filename: String, _ type: T.Type) {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let dataAssetName: String = filename
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: dataAssetName) else {
            return
    }
    
    do {
        expositionData = try jsonDecoder.decode(Exposition, from: dataAsset.data)
    } catch DecodingError.dataCorrupted(let context) {
        print("데이터가 손상되었거나 유효하지 않습니다.")
        print(context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        showAlertMessage("데이터가 손상되었거나 유효하지 않습니다.")
    } catch DecodingError.keyNotFound(let codingkey, let context) {
        print("주어진 키를 찾을수 없습니다.")
        print(codingkey.intValue ?? Optional(nil)! , codingkey.stringValue , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        showAlertMessage("주어진 키를 찾을수 없습니다.")
    } catch DecodingError.typeMismatch(let type, let context) {
        print("주어진 타입과 일치하지 않습니다.")
        print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        showAlertMessage("주어진 타입과 일치하지 않습니다.")
    } catch DecodingError.valueNotFound(let type, let context) {
        print("예상하지 않은 null 값이 발견되었습니다.")
        print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        showAlertMessage("예상하지 않은 null 값이 발견되었습니다.")
    } catch {
        print("그외 에러가 발생했습니다.")
        showAlertMessage("그외 에러가 발생했습니다.")
    }
    }
    
    func showAlertMessage(_ errorMessage: String) {
        let alert = UIAlertController(title: nil, message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
    }
}
