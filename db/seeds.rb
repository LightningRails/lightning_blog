# Lightning Blog Sample Data

# Create categories
tech_category = LightningBlog::Category.find_or_create_by(name: "Technology") do |category|
  category.slug = "technology"
  category.description = "Posts about the latest in technology and software development"
end

rails_category = LightningBlog::Category.find_or_create_by(name: "Ruby on Rails") do |category|
  category.slug = "ruby-on-rails"
  category.description = "Tips, tricks, and tutorials for Ruby on Rails development"
end

business_category = LightningBlog::Category.find_or_create_by(name: "Business") do |category|
  category.slug = "business"
  category.description = "Insights about building and growing online businesses"
end

# Create sample posts
posts_data = [
  {
    title: "Getting Started with Lightning Rails",
    slug: "getting-started-with-lightning-rails",
    excerpt: "Learn how to quickly build modern web applications with Lightning Rails, the Rails boilerplate for solopreneurs.",
    content: "Lightning Rails is a comprehensive Ruby on Rails boilerplate designed specifically for solopreneurs and indie developers who want to build and launch web applications quickly. 

In this post, we'll explore the key features that make Lightning Rails an excellent choice for your next project:

**1. Authentication Ready**
Lightning Rails comes with user authentication built-in using Devise. You can have users signing up, logging in, and managing their accounts within minutes of setup.

**2. Payment Integration**
Stripe integration is pre-configured, allowing you to start accepting payments immediately. Whether you're building a SaaS application or selling products, the payment flow is already handled.

**3. Modern UI Components**
The interface is built with modern design principles and includes responsive components that work great on both desktop and mobile devices.

**4. SEO Optimized**
Built-in SEO features help your application rank better in search engines from day one.

**5. Easy Deployment**
Deploy to Heroku or other platforms with simple configuration files and deployment scripts.

Getting started is as simple as cloning the repository and running the setup script. Within minutes, you'll have a fully functional web application ready for customization.",
    category: rails_category,
    published: true,
    published_at: 2.days.ago
  },
  {
    title: "Building a SaaS with Lightning Rails: A Complete Guide",
    slug: "building-saas-with-lightning-rails-complete-guide",
    excerpt: "A comprehensive guide to building and launching your SaaS application using Lightning Rails as your foundation.",
    content: "Building a Software as a Service (SaaS) application can be daunting, especially when you're a solo developer or part of a small team. Lightning Rails simplifies this process by providing a solid foundation with all the essential features you need.

**Planning Your SaaS**

Before diving into code, it's crucial to plan your SaaS application:

1. **Define your target audience**: Who will use your application?
2. **Identify the core problem**: What specific problem does your SaaS solve?
3. **Plan your features**: What features are essential for your MVP?
4. **Design your pricing strategy**: How will you monetize your application?

**Setting Up Lightning Rails for SaaS**

Lightning Rails provides several features that are perfect for SaaS applications:

- **User Management**: Multi-tenant architecture support
- **Subscription Handling**: Stripe integration for recurring payments
- **Admin Dashboard**: Manage users and monitor your application
- **Analytics**: Built-in tracking for user behavior and business metrics

**Development Best Practices**

When building with Lightning Rails:

1. Start with the MVP features
2. Use the built-in components to maintain consistency
3. Leverage the authentication system for user management
4. Implement proper error handling and monitoring
5. Test thoroughly before deployment

**Deployment and Scaling**

Lightning Rails applications are designed to scale. The architecture supports:

- Horizontal scaling with load balancers
- Database optimization techniques
- Caching strategies for improved performance
- CDN integration for static assets

**Conclusion**

With Lightning Rails, you can focus on building your unique features instead of reinventing the wheel. The boilerplate provides a solid foundation that scales with your business needs.",
    category: rails_category,
    published: true,
    published_at: 1.week.ago
  },
  {
    title: "Modern Web Development Trends in 2024",
    slug: "modern-web-development-trends-2024",
    excerpt: "Explore the latest trends in web development that are shaping how we build applications in 2024.",
    content: "The web development landscape continues to evolve rapidly. As we progress through 2024, several trends are emerging that will shape how we build web applications.

**1. AI-Powered Development Tools**

Artificial Intelligence is revolutionizing how developers write code. Tools like GitHub Copilot and ChatGPT are helping developers:

- Generate boilerplate code faster
- Debug complex issues more efficiently
- Learn new frameworks and libraries
- Optimize existing code for performance

**2. Edge Computing and CDNs**

Moving computation closer to users is becoming increasingly important:

- Reduced latency for better user experience
- Improved performance for dynamic content
- Better handling of global traffic
- Cost optimization for bandwidth

**3. Serverless Architecture**

Serverless continues to gain traction for specific use cases:

- Event-driven applications
- Microservices architecture
- Cost-effective scaling
- Reduced operational overhead

**4. Progressive Web Apps (PWAs)**

PWAs are bridging the gap between web and mobile applications:

- Offline functionality
- Push notifications
- App-like user experience
- Single codebase for multiple platforms

**5. Enhanced Security Measures**

Security remains a top priority with new approaches:

- Zero-trust architecture
- Advanced authentication methods
- Better handling of sensitive data
- Compliance with privacy regulations

**The Future of Web Development**

As we look ahead, web development will continue to focus on:

- Developer experience and productivity
- User experience and performance
- Security and privacy
- Accessibility and inclusion

Staying current with these trends will help you build better applications and advance your career in web development.",
    category: tech_category,
    published: true,
    published_at: 3.days.ago
  },
  {
    title: "From Idea to Launch: My SaaS Journey",
    slug: "from-idea-to-launch-my-saas-journey",
    excerpt: "The story of building and launching a successful SaaS application as a solo entrepreneur.",
    content: "Starting a SaaS business as a solo entrepreneur is both exciting and challenging. Here's my journey from idea to successful launch.

**The Idea**

Like many entrepreneurs, my SaaS idea came from personal frustration. I was spending too much time on repetitive tasks that I knew could be automated. After validating the problem with potential customers, I decided to build a solution.

**Choosing the Right Tools**

Technology choices can make or break a solo project. I chose:

- **Lightning Rails** for rapid development
- **Stripe** for payment processing
- **Heroku** for easy deployment
- **Intercom** for customer support

Lightning Rails was particularly valuable because it provided:
- Authentication system
- Payment integration
- Admin dashboard
- SEO optimization
- Responsive design

**The Development Process**

Building alone meant I had to be strategic about what to build first:

1. **MVP Definition**: I listed all possible features and cut 80% of them
2. **User Flow Design**: I mapped out the essential user journeys
3. **Database Design**: Simple but scalable schema
4. **Feature Implementation**: One feature at a time, fully tested
5. **User Testing**: Early feedback from beta users

**Pre-Launch Activities**

Before launching publicly, I focused on:

- **Landing Page**: Clear value proposition and benefits
- **Documentation**: Comprehensive help center
- **Pricing Strategy**: Simple, value-based pricing
- **Legal Pages**: Terms of service and privacy policy
- **Analytics Setup**: Tracking key metrics from day one

**Launch Day and Beyond**

Launch day was both exciting and nerve-wracking. Here's what happened:

- **Product Hunt Launch**: Reached #3 product of the day
- **Initial Customers**: 50+ signups in the first week
- **Feedback Collection**: Continuous improvement based on user feedback
- **Marketing Efforts**: Content marketing and social media

**Lessons Learned**

Key takeaways from my journey:

1. **Start Simple**: MVP is truly the minimum viable product
2. **Listen to Users**: Customer feedback is invaluable
3. **Focus on Value**: Solve real problems for real people
4. **Be Patient**: Growth takes time, especially organic growth
5. **Stay Flexible**: Be ready to pivot based on market feedback

**Current Status**

Six months post-launch:
- 500+ active users
- $15,000 monthly recurring revenue
- 95% customer satisfaction rate
- Planning international expansion

**Advice for Aspiring SaaS Entrepreneurs**

If you're considering building a SaaS:

- Validate your idea before building
- Choose proven technologies and frameworks
- Focus on solving one problem really well
- Build a community around your product
- Don't be afraid to charge for value

Building a SaaS is challenging but incredibly rewarding. With the right tools and mindset, anyone can do it.",
    category: business_category,
    published: true,
    published_at: 5.days.ago
  },
  {
    title: "Rails 8.0: What's New and Exciting",
    slug: "rails-8-whats-new-and-exciting",
    excerpt: "Discover the new features and improvements in Rails 8.0 that will enhance your development experience.",
    content: "Rails 8.0 brings exciting new features and improvements that make web development even more enjoyable and productive.

**Major New Features**

**1. Solid Queue**
A new job queue backend that runs entirely in your database:
- No Redis dependency required
- Better reliability and data consistency
- Built-in web UI for monitoring jobs
- Supports job priorities and delays

**2. Solid Cable**
A new Action Cable adapter for WebSocket connections:
- Database-backed WebSocket connections
- Simpler deployment and scaling
- Better debugging and monitoring capabilities

**3. Authentication Generator**
Rails now includes a built-in authentication generator:
- Generates secure, basic authentication
- Includes password reset functionality
- Session management out of the box
- Easy to customize and extend

**Performance Improvements**

Rails 8.0 includes several performance enhancements:

- **Faster Boot Times**: Reduced application startup time
- **Memory Optimization**: Lower memory usage in production
- **Query Optimization**: Better SQL generation and caching
- **Asset Pipeline**: Improved asset compilation and delivery

**Developer Experience**

The developer experience continues to improve:

- **Better Error Pages**: More informative error messages
- **Enhanced Console**: Improved Rails console with better debugging
- **Generator Improvements**: More flexible and customizable generators
- **Testing Enhancements**: Better testing tools and helpers

**Breaking Changes**

Rails 8.0 includes some breaking changes:

- Minimum Ruby version is now 3.1.0
- Some deprecated features have been removed
- Configuration changes for certain middleware
- Updated default values for security settings

**Migration Guide**

Upgrading to Rails 8.0:

1. **Update Ruby**: Ensure you're running Ruby 3.1.0 or later
2. **Update Gemfile**: Specify Rails 8.0 in your Gemfile
3. **Run Updates**: Use `rails app:update` to update configuration
4. **Test Thoroughly**: Run your test suite to catch any issues
5. **Review Changes**: Check the changelog for specific changes

**New Gems and Dependencies**

Rails 8.0 introduces new default gems:

- **propshaft**: New asset pipeline (alternative to Sprockets)
- **solid_queue**: Database-backed job processing
- **solid_cable**: Database-backed WebSocket connections
- **authentication**: Built-in authentication solution

**Best Practices for Rails 8.0**

To make the most of Rails 8.0:

- Use the new authentication generator for new projects
- Consider Solid Queue for background job processing
- Take advantage of the performance improvements
- Keep up with security updates and best practices
- Contribute to the Rails community by reporting bugs and feedback

**Looking Forward**

Rails 8.0 sets the foundation for future improvements:

- Continued focus on developer happiness
- Better performance and scalability
- Enhanced security features
- Improved testing and debugging tools

Rails continues to be an excellent choice for web development, and Rails 8.0 makes it even better. Whether you're building a simple web application or a complex SaaS platform, Rails provides the tools and conventions you need to be productive.",
    category: rails_category,
    published: false
  }
]

posts_data.each do |post_data|
  post = LightningBlog::Post.find_or_create_by(slug: post_data[:slug]) do |post|
    post.title = post_data[:title]
    post.excerpt = post_data[:excerpt]
    post.content = post_data[:content]
    post.category = post_data[:category]
    post.published = post_data[:published]
    post.published_at = post_data[:published_at]
  end
  
  puts "Created post: #{post.title}"
end

puts "\nSeed data created successfully!"
puts "Categories: #{LightningBlog::Category.count}"
puts "Posts: #{LightningBlog::Post.count}"
puts "Published posts: #{LightningBlog::Post.published.count}" 