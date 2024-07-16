@macroType(.statement)
macro defer {
    { #body: BlockContent } => {
        class #uniqueId('class);

        impl #uniqueId('class) {
            func deinit() {
                #body
            }
        }

        let #uniqueId('instance) = #uniqueId('class)();
    }
}