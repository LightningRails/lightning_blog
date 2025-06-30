# Testing Lightning Blog

This guide helps you test Lightning Blog in different Rails environments to ensure compatibility.

## Test Environments

### 1. Lightning Rails Environment (Optimal)

**Setup:**
```bash
# Install Lightning Rails
gem install lightning_rails
lightning_rails new my_blog_test_app
cd my_blog_test_app

# Add Lightning Blog to Gemfile
echo 'gem "lightning_blog", path: "/path/to/lightning_blog"' >> Gemfile
bundle install

# Install Lightning Blog
rails generate lightning_blog:install
rails db:create db:migrate db:seed

# Start server
./bin/dev
```

**Expected Result:** ✅ Full styling with Tailwind CSS + DaisyUI components

---

### 2. Rails + Tailwind CSS + DaisyUI (Enhanced)

**Setup:** Follow the [official DaisyUI Rails installation guide](https://daisyui.com/docs/install/rails/)

```bash
# Create new Rails app
rails new blog_test_app
cd blog_test_app

# Install Tailwind CSS (Rails 7.0+)
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install

# Choose one of the 3 official DaisyUI installation methods:
```

#### Method 1: NPM Plugin (Recommended)
```bash
npm init -y
npm install daisyui@latest

# Add to app/assets/tailwind/application.css:
echo '@plugin "daisyui";' >> app/assets/tailwind/application.css
```

#### Method 2: Downloaded JS (No Node.js)
```bash
curl -sLo app/assets/tailwind/daisyui.js https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.js

# Add to app/assets/tailwind/application.css:
echo '@plugin "./daisyui.js";' >> app/assets/tailwind/application.css
```

#### Method 3: CDN Import (Quick)
```bash
# Add to app/assets/tailwind/application.css:
echo '@import "https://cdn.jsdelivr.net/npm/daisyui@5";' >> app/assets/tailwind/application.css
```

**Continue Setup:**
```bash
# Add Lightning Blog
echo 'gem "lightning_blog", path: "/path/to/lightning_blog"' >> Gemfile
bundle install

# Install Lightning Blog
rails generate lightning_blog:install
rails db:create db:migrate db:seed

# Start servers
./bin/dev
```

**Expected Result:** ✅ Enhanced styling with Tailwind + DaisyUI components

---

### 3. Rails + Tailwind CSS Only (Good)

**Setup:**
```bash
# Create new Rails app with Tailwind
rails new blog_test_app --css tailwind
cd blog_test_app

# Add Lightning Blog
echo 'gem "lightning_blog", path: "/path/to/lightning_blog"' >> Gemfile
bundle install

# Install Lightning Blog
rails generate lightning_blog:install
rails db:create db:migrate db:seed

# Start server
rails server
```

**Expected Result:** ✅ Good styling with Tailwind classes, fallback for DaisyUI components

---

### 4. Standard Rails (Compatible)

**Setup:**
```bash
# Create standard Rails app
rails new standard_blog_test
cd standard_blog_test

# Add Lightning Blog
echo 'gem "lightning_blog", path: "/path/to/lightning_blog"' >> Gemfile
bundle install

# Install Lightning Blog
rails generate lightning_blog:install
rails db:create db:migrate db:seed

# Start server
rails server
```

**Expected Result:** ✅ Beautiful fallback styles, all functionality works

---

## Testing Checklist

For each environment, verify:

### ✅ **Installation**
- [ ] `rails generate lightning_blog:install` completes successfully
- [ ] Installer correctly detects Tailwind/DaisyUI setup
- [ ] Migrations run without errors
- [ ] Routes are properly mounted

### ✅ **Functionality**
- [ ] Blog index page loads (`/blog`)
- [ ] Individual post pages work (`/blog/post-slug`)
- [ ] Category pages function (`/blog/categories`)
- [ ] Search functionality works (`/blog?search=term`)
- [ ] View tracking increments properly
- [ ] SEO metadata appears in page source

### ✅ **Styling** 
- [ ] Pages render with appropriate styles for the environment
- [ ] Responsive design works on mobile/desktop
- [ ] Dark mode support (if Tailwind/DaisyUI available)
- [ ] Typography is readable
- [ ] Forms are properly styled
- [ ] Buttons and interactive elements work

### ✅ **Content Management**
- [ ] Sample seed data loads correctly
- [ ] Posts can be created programmatically
- [ ] Categories function properly
- [ ] Featured images work (Active Storage)
- [ ] Search finds relevant content

## Setup Detection Testing

Test the installer's detection accuracy:

```bash
# Test detection
rails generate lightning_blog:install

# Should show one of:
# ✅ Perfect! Your app has Tailwind CSS + DaisyUI (Method: NPM Plugin)
# ✅ Perfect! Your app has Tailwind CSS + DaisyUI (Method: Downloaded JS)  
# ✅ Perfect! Your app has Tailwind CSS + DaisyUI (Method: CDN Import)
# ✅ Great! Your app has Tailwind CSS
# ✅ Your app will use Lightning Blog's fallback styles
```

## Expected Visual Results

### Lightning Rails / Tailwind + DaisyUI
- Modern card layouts with shadows and rounded corners
- DaisyUI buttons (btn, btn-primary, etc.)
- Proper badge styling for categories
- Join components for pagination
- Enhanced typography with proper spacing

### Tailwind Only
- Tailwind utility classes applied
- Clean typography and spacing
- Responsive grid layouts
- Basic button styling

### Standard Rails
- Clean, modern fallback styles
- Proper typography hierarchy  
- Responsive layout without utility classes
- CSS Grid/Flexbox layouts
- Consistent spacing and colors

## Common Issues & Solutions

### DaisyUI Not Loading
```bash
# Verify DaisyUI is properly installed per official guide:
# https://daisyui.com/docs/install/rails/

# Check your app/assets/tailwind/application.css contains one of:
# @plugin "daisyui";
# @plugin "./daisyui.js"; 
# @import "https://cdn.jsdelivr.net/npm/daisyui@5";
```

### Styling Issues
```bash
# Clear Tailwind cache and restart
rm -rf tmp/cache
./bin/dev # or rails server
```

### Migration Errors
```bash
# Check for conflicts with existing tables
rails db:rollback
# Fix any conflicts, then:
rails db:migrate
```

---

## Performance Testing

Test in each environment:

```bash
# Check page load times
curl -w "@curl-format.txt" -o /dev/null -s "http://localhost:3000/blog"

# Monitor memory usage
ps aux | grep rails

# Test with many posts
# Create 100+ sample posts and test pagination performance
```

## Contributing Test Results

When contributing, please test in at least 2 different environments and include:

1. Rails version
2. Ruby version  
3. Tailwind/DaisyUI setup method
4. Test results for all checklist items
5. Screenshots showing visual rendering
6. Any issues encountered and solutions

---

**Official Resources:**
- 📖 [DaisyUI Rails Installation Guide](https://daisyui.com/docs/install/rails/)
- ⚡ [Lightning Rails Documentation](https://docs.lightningrails.com/)
- 🧪 [Rails Testing Guide](https://guides.rubyonrails.org/testing.html) 