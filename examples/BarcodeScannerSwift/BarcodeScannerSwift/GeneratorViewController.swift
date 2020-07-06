import UIKit
import ZXingObjC

class GeneratorViewController: UIViewController {

	@IBOutlet weak var generatedImage: UIImageView!
	@IBOutlet weak var textField: UITextField!

	@IBAction func didTouchGenerateButton(_ sender: Any) {
	
		guard let text = textField.text else {
			print("please add a text that is used to be generated")
			return
		}
		
		let writer = ZXDataMatrixWriter()
		do {
			
			let hints = ZXEncodeHints()
			hints.
			let matrix = try writer.encode(text,
										   format: ZXBarcodeFormat(rawValue: kBarcodeFormatDataMatrix.rawValue) ,
										   width: 300,
										   height: 300,
										   hints: nil)
			
			if let cgImage = ZXImage(matrix: matrix).cgimage {
				
				generatedImage.image = UIImage(cgImage: cgImage)
			}
		} catch {
			print(error)
		}
		
		
	}
}
    
