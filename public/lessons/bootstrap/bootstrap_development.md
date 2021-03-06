
# Welcome to Bootstrap!

Bootstrap is a mobile first, open-source, front-end development framework that helps developers and designers to easily build responsive websites.

* Originally created by a developer and designer at Twitter in 2010
* Allows you to apply a vast library of styles and layouts to your website, simply by adding specific classes to your HTML elements. * These base styles normalize the overall UI of your website across modern browsers.
* This establishes a standard look and feel for specific elements such as buttons, tables, typography, forms, and more.

![Image of Bootstrap logo](https://www.vectorlogo.zone/logos/getbootstrap/getbootstrap-card.png "Bootstrap Logo")

# The 12 Column Layout

Bootstrap employs a *12 column layout* to help easily establish a styles for a responsive website. By adding classes to your HTML elements, you can set how many columns each div will span (out of 12). These classes are as follows:

![Bootstrap 12 column grid](https://mobomo.s3.amazonaws.com/uploads/2017/09/BlogArticle-BootstrapGrid.png "Bootstrap Grid System")

```css

col-xl-12 // class used for extra large devices ~ 1200px
col-lg-12 // class used for large devices like laptops ~ 992px
col-md-12 // class used for medium devices like tablets ~ 768px
col-sm-12// class used for small devices like mobile phones ~ 768px
```

* Lg, md, and sm designate the screen size, while the number indicates how many columns the element will span.
* Tip: If more than 12 columns are designated inside a *row* (ex. an element 5 columns wide and an element 10 columns wide), extra columns will wrap to a new line;


# Example of 12 Column Layout

* If I want a sidebar on my website, I may want it to take up 3 columns, or one quarter of the page width (25%).
* To achieve this I would assign it the class `col-sm-3`. This would add the following code:

```html
<div class="sidebar col-sm-3">
  <ul>
    <li>My</li>
    <li>Sidebar</li>
    <li>Items</li>
  <ul>
</div>
```

```css

.sidebar {
  width: 25%;
}

```

* Because the only class is `col-sm-3`, and no other screen size classes are being used, it will be 25% at all screen sizes. In other words, if you want your element to take up a given number of columns at all screen sizes, only add a `col-sm-` declaration.
* An element that is full-width at all screen sizes would have the class `col-sm-12`.

# Example with Different Widths for Different Screen Sizes

* You may want your sidebar to be full width on a mobile device, but change to a quarter width on desktop. In this instance you would add the following two classes: `col-sm-12 col-md-3`. This applies the following CSS:

```css

.sidebar {
  width: 100%;
}


@media screen and (min-width:768px) {
  .sidebar {
    width: 25%;
  }
}
```

* As you can see, this is where media queries come into play.
* Because the width needs to change on screens larger than a mobile device, Bootstrap adds a media query that says, 'when the screen is larger than 992px, shrink to 25% width'.
* Remember, because Bootstrap is a mobile-first development platform, the media query changes the layout for deskop screen size, not mobile screen size.

<IMG OF BOOTSTRAP SIDEBAR>

# The Bootstrap Grid

Since websites are not newspapers, content is not exclusively broken out into columns. You will likely want to place your columns inside of *rows* as well. This is straight-forward with Bootstrap - simply nest your column divs in an element with the class `row`!

* IMPORTANT: Rows need to be wrapped within a `.container` (fixed-width) or a `.container-fluid` (full-width) element.
* Padding is automatically added to columns to add a 'gutter' in between elements.
* The left and right padding of the first and last elements is then removed via negative margins that are applied to rows. Because of this, elements need to be nested in the following order: `container > row > columns`.

![Bootstrap columns and rows](https://i.imgur.com/FaYuui8.png "Bootstrap Rows")

# The Bootstrap Grid Examples

```html
<!-- this could also be "container-fluid" -->
<div class="container">
  <div class="row">
    <div class="col-sm-3">
      Content 25% of page width
    </div>
    <div class="col-sm-6">
      Content 50% of page width
    </div>
  </div>
</div>
```

<div class="container">
  <div class="row">
    <div class="col-sm-3" style="background-color: #563d7c26; border: 1px, solid, black;">
      Column with 25% of content width
    </div>
    <div class="col-sm-6" style="background-color: #563d7c10">
      Column with 50% of content width
    </div>
  </div>
</div>

# Bootstrap Grid Example 2

```html
<div class="container">
  <div class="row">
    <div class="col">
      1 of 2
    </div>
    <div class="col">
      2 of 2
    </div>
  </div>
  <div class="row">
    <div class="col">
      1 of 3
    </div>
    <div class="col">
      2 of 3
    </div>
    <div class="col">
      3 of 3
    </div>
  </div>
</div>
```

<div class="container">
  <div class="row">
    <div class="col" style="background-color: #563a7a20">
      1 of 2
    </div>
    <div class="col" style="background-color: #503f7b10">
      2 of 2
    </div>
  </div>
  <div class="row">
    <div class="col" style="background-color: #563c7c28">
      1 of 3
    </div>
    <div class="col" style="background-color: #563d7d32">
      2 of 3
    </div>
    <div class="col" style="background-color: #563e7e10">
      3 of 3
    </div>
  </div>
</div>

# Media Query Breakpoints

* Bootstrap has media query breakpoints for small, medium, large, and x-large device screens

```css

// Small devices (landscape phones, 576px and up)
@media (min-width: 576px) { ... }

// Medium devices (tablets, 768px and up)
@media (min-width: 768px) { ... }

// Large devices (desktops, 992px and up)
@media (min-width: 992px) { ... }

// Extra large devices (large desktops, 1200px and up)
@media (min-width: 1200px) { ... }
```
