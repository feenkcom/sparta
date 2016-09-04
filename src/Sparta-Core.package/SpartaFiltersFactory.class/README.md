I am a filter factory.

I know recepies of the very common filter and simplify developers life. I am also a nice place to add new app-specific filters as extention methods.

I am not backend specific since I only rely on public abstract api. It is very convenient for filters factory, we implement custom filter once and get support of it on all backends.

For a moment I provide four instagram-like filters to show an idea.

Public API and Key Messages

- brannan: create brannan filter for provided source.
- grayscale: create grayscale filter for provided source.
- inkwell: create grayscale filter for provided source.
- nashville: create nashville filter for provided source

kitty := canvas bitmap fromFileNamed: 'images/cats/kitty.jpg'.
brannan := canvas filters brannan: kitty.