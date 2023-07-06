# Dependency Property Prototype

This project contains a prototype to show how we can model DependencyProperites after `Published` properties.

Furthermore, we can also specially generate them in a manner which enforces type safety when using Styles/Setters.

See the code in `Sources` dir for the API and explanation.

See the Tests for use cases

## Open Questions

The `Style` class has a type-erased base class `StyleBase` which is what the API would expose, however this type wouldn't be constructible. 

In theory, someone could still apply an incorrect `Style` to a framework element. For example, something like this is allowed:

```
let obj = MyDO()
obj.Style = Style(targetType.MyOtherDO) { ... }
```

Is there a way to validate this?