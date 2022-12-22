@main
public struct KituraSampleApp {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(KituraSampleApp().text)
    }
}
