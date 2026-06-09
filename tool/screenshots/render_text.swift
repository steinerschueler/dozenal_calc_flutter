import AppKit
// args: out fontSize hexColor maxWidth align weight lineSpacingFactor text
let a = CommandLine.arguments
guard a.count >= 9 else { FileHandle.standardError.write("usage\n".data(using:.utf8)!); exit(2) }
let out = a[1], size = CGFloat(Double(a[2])!), hex = a[3], maxW = CGFloat(Double(a[4])!)
let align = a[5], weightS = a[6], lsf = CGFloat(Double(a[7])!)
let text = a[8].replacingOccurrences(of: "\\n", with: "\n")
func col(_ h: String) -> NSColor { var s=h; if s.hasPrefix("#"){s.removeFirst()}; let v=UInt32(s,radix:16) ?? 0xFFFFFF
  return NSColor(red:CGFloat((v>>16)&255)/255, green:CGFloat((v>>8)&255)/255, blue:CGFloat(v&255)/255, alpha:1) }
let weight: NSFont.Weight = weightS=="semibold" ? .semibold : (weightS=="bold" ? .bold : .regular)
let font = NSFont.systemFont(ofSize: size, weight: weight)
let p = NSMutableParagraphStyle()
p.alignment = align=="center" ? .center : (align=="right" ? .right : (align=="left" ? .left : .natural))
p.lineSpacing = size * lsf
let attr: [NSAttributedString.Key:Any] = [.font:font, .foregroundColor:col(hex), .paragraphStyle:p]
let s = NSAttributedString(string:text, attributes:attr)
let bb = s.boundingRect(with: NSSize(width:maxW, height:.greatestFiniteMagnitude), options:[.usesLineFragmentOrigin,.usesFontLeading])
let w = Int(ceil(maxW)), h = Int(ceil(bb.height))+12
let rep = NSBitmapImageRep(bitmapDataPlanes:nil, pixelsWide:w, pixelsHigh:h, bitsPerSample:8, samplesPerPixel:4, hasAlpha:true, isPlanar:false, colorSpaceName:.deviceRGB, bytesPerRow:0, bitsPerPixel:0)!
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
s.draw(with: NSRect(x:0,y:0,width:CGFloat(w),height:CGFloat(h)), options:[.usesLineFragmentOrigin,.usesFontLeading])
NSGraphicsContext.restoreGraphicsState()
try! rep.representation(using:.png, properties:[:])!.write(to: URL(fileURLWithPath: out))
print("\(w)x\(h)")
