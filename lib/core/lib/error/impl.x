impl<T, E: ErrorCode> T throw E {
    func unwrap() throw => try this;
    func operator suffix?() => try this catch { nil };
    func operator suffix!() => try this;

    func expect(failMessage: string) => try this catch { panic(failMessage) };
}