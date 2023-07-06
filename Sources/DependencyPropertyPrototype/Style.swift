// "Base" class which is type-erased and is the type that would be used at the API surface. It can't be constructed directly.
public class StyleBase: DependencyObject {
    fileprivate init(fromABI: StyleAbi){
        super.init(fromABi: fromABI)
    }
}

// The Style class would be specially handgenerated to be applied to a specific type.
public class Style<AppliedTo: DependencyObject>: StyleBase {
    var targetType: AppliedTo.Type?
    var setters: [Setter<AppliedTo>] = []

    @resultBuilder
    public enum SetterBuilder {
        public static func buildBlock(_ setters: Setter<AppliedTo>...) -> [Setter<AppliedTo>] {
            setters
        }
    }

    public convenience init(targetType: AppliedTo.Type, @SetterBuilder _ builder: () -> [Setter<AppliedTo>]) {
        self.init(fromABi: StyleAbi())
        self.targetType = targetType
    }

    public convenience init(targetType: AppliedTo.Type) {
        self.init(fromABi: StyleAbi())
        self.targetType = targetType
    }
}

