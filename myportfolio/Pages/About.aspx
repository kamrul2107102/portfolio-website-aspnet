<%@ Page Title="About Me" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="myportfolio.Pages.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-dyZKH2Un+6s3F70F+GjG9+fRkqefM+QlOZ9d8/ovzUHIvXyH7r6tKcF10lbhjzZLShK1qYxZ6rP8FtxZk0I5PA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <!-- Devicon CDN for tech icons -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/devicon/2.15.1/devicon.min.css" />

    <!-- Hero Section -->
<section class="hero-about">
    <div class="profile-card">
        <!-- Left Side: Profile Image + Name/Title/Buttons -->
        <div class="profile-left">
            <div class="profile-image">
                <img src="/images/kamrul.jpg" alt="Kamrul Islam - Full Stack Developer"
                     onerror="this.src='https://via.placeholder.com/280x280/667eea/white?text=KI'" />
            </div>
            <div class="profile-info">
                <h1 class="name">Kamrul Islam</h1>
                <h3 class="title">Full Stack Developer</h3>
                <p class="lead">
                    Passionate full stack developer with expertise in modern web technologies. I create robust, scalable applications that solve real-world problems.
                </p>
                <div class="buttons">
                    <a href="https://github.com/kamrulIslam" target="_blank" class="btn">GitHub</a>
                    <a href="mailto:kamrulislam@gmail.com" class="btn btn-outline">Email Me</a>
                    <a href="#" class="btn btn-outline">Resume</a>
                </div>
            </div>
        </div>

        <!-- Right Side: About Details -->
        <div class="about-details">
            <h4>Background</h4>
            <p>
                With a strong foundation in both frontend and backend technologies, 
                I specialize in building complete web applications from concept to deployment. 
                My experience spans across various industries and project scales.
            </p>

            <h4>Philosophy</h4>
            <p>
                I believe in writing clean, maintainable code and creating user experiences 
                that are both functional and delightful. Continuous learning and staying 
                updated with the latest technologies is part of my professional approach.
            </p>
        </div>
    </div>
</section>



                    <!-- Skills Section - Card Layout -->
                    <h3 class="mb-4 text-center">Technical Skills</h3>
                    <div class="row" id="skills-section">
                        <!-- Frontend Card -->
                        <div class="col-lg-6 mb-4">
                            <div class="skills-card h-100">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">
                                        <i class="fas fa-laptop-code me-2"></i>Frontend Technologies
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="skill mb-3">
                                        <label><i class="devicon-html5-plain colored me-2"></i>HTML5</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="95">0%</div>
                                        </div>
                                    </div>
                                    <div class="skill mb-3">
                                        <label><i class="devicon-css3-plain colored me-2"></i>CSS3</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="90">0%</div>
                                        </div>
                                    </div>
                                    <div class="skill mb-3">
                                        <label><i class="devicon-javascript-plain colored me-2"></i>JavaScript</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="85">0%</div>
                                        </div>
                                    </div>
                                    <div class="skill mb-3">
                                        <label><i class="devicon-bootstrap-plain colored me-2"></i>Bootstrap</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="90">0%</div>
                                        </div>
                                    </div>
                                    <div class="skill mb-3">
                                        <label><i class="devicon-react-original colored me-2"></i>React</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="80">0%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Backend Card -->
                        <div class="col-lg-6 mb-4">
                            <div class="skills-card h-100">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">
                                        <i class="fas fa-server me-2"></i>Backend Technologies
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="skill mb-3">
                                        <label><i class="devicon-dot-net-plain colored me-2"></i>ASP.NET</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="90">0%</div>
                                        </div>
                                    </div>
                                    <div class="skill mb-3">
                                        <label><i class="devicon-csharp-plain colored me-2"></i>C#</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="85">0%</div>
                                        </div>
                                    </div>
                                    <div class="skill mb-3">
                                        <label><i class="devicon-microsoftsqlserver-plain colored me-2"></i>SQL Server</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="80">0%</div>
                                        </div>
                                    </div>
                                    <div class="skill mb-3">
                                        <label><i class="devicon-dotnetcore-plain colored me-2"></i>Entity Framework</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="85">0%</div>
                                        </div>
                                    </div>
                                    <div class="skill mb-3">
                                        <label><i class="devicon-nodejs-plain colored me-2"></i>Node.js</label>
                                        <div class="progress">
                                            <div class="progress-bar" data-progress="70">0%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Professional Stats & Contact Info Section -->
                    <section class="info-stats-section mt-5">
                        <div class="info-stats-grid">
                            <!-- Contact Information -->
                            <div class="card contact-info-card">
                                <div class="card-header">
                                    <h4><i class="fas fa-address-card me-2"></i>Contact Information</h4>
                                </div>
                                <div class="card-body">
                                    <div class="contact-info">
                                        <div class="info-item">
                                            <i class="fas fa-home"></i>
                                            <span>Fulbarigate, KUET, Khulna, Bangladesh</span>
                                        </div>
                                        <div class="info-item">
                                            <i class="fas fa-envelope"></i>
                                            <a href="mailto:kamrulIslam@gmail.com">kamrulIslam@gmail.com</a>
                                        </div>
                                        <div class="info-item">
                                            <i class="fas fa-phone"></i>
                                            <a href="tel:+8801531761618">01531761618</a>
                                        </div>
                                        <div class="info-item">
                                            <i class="fas fa-language"></i>
                                            <span>Bengali (Native), English (Fluent)</span>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="social-links">
                                        <a href="https://github.com/kamrul" target="_blank" class="social-link">
                                            <i class="fab fa-github"></i>
                                        </a>
                                        <a href="https://www.facebook.com/kamrul" target="_blank" class="social-link">
                                            <i class="fab fa-facebook-f"></i>
                                        </a>
                                        <a href="https://www.linkedin.com/in/kamrul" target="_blank" class="social-link">
                                            <i class="fab fa-linkedin-in"></i>
                                        </a>
                                        <a href="mailto:kamrulIslam@gmail.com" class="social-link">
                                            <i class="fas fa-envelope"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Professional Stats -->
                            <div class="card stats-card">
                                <div class="card-header">
                                    <h4><i class="fas fa-chart-line me-2"></i>Professional Stats</h4>
                                </div>
                                <div class="card-body">
                                    <div class="stats-grid">
                                        <div class="stat-item">
                                            <i class="fas fa-project-diagram"></i>
                                            <h3 class="counter" data-target="15">0</h3>
                                            <p>Projects Completed</p>
                                        </div>
                                        <div class="stat-item">
                                            <i class="fas fa-briefcase"></i>
                                            <h3 class="counter" data-target="2">0</h3>
                                            <p>Years Experience</p>
                                        </div>
                                        <div class="stat-item">
                                            <i class="fas fa-users"></i>
                                            <h3 class="counter" data-target="10">0</h3>
                                            <p>Clients</p>
                                        </div>
                                        <div class="stat-item">
                                            <i class="fas fa-award"></i>
                                            <h3 class="counter" data-target="3">0</h3>
                                            <p>Awards</p>
                                        </div>
                                        <div class="stat-item">
                                            <i class="fas fa-certificate"></i>
                                            <h3 class="counter" data-target="5">0</h3>
                                            <p>Certifications</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <!-- Sidebar -->
                <div class="col-lg-4">
                    <div class="sticky-sidebar">
                        <!-- Quick Contact Card -->
                        <div class="card quick-contact-card mb-4">
                            <div class="card-body text-center">
                                <h5 class="card-title">Let's Connect</h5>
                                <p class="text-muted">Ready to start your next project?</p>
                                <a href="mailto:kamrulIslam@gmail.com" class="btn btn-primary btn-block">
                                    <i class="fas fa-paper-plane me-2"></i>Send Message
                                </a>
                            </div>
                        </div>

                        <!-- Availability Card -->
                        <div class="card availability-card">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <span class="status-dot available"></span>Available for Work
                                </h5>
                                <p class="text-muted mb-0">Currently accepting new projects and collaborations.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="py-5 testimonial-section">
        <div class="container text-center">
            <h2 class="mb-5 text-white">What People Say</h2>
            <div class="testimonial-slider">
                <!-- Testimonial 1 -->
                <div class="testimonial active">
                    <i class="fas fa-quote-left text-warning fa-2x mb-3"></i>
                    <p class="lead text-white">"Kamrul delivered an exceptional e-commerce platform that exceeded our expectations. His attention to detail and technical expertise is outstanding."</p>
                    <div class="stars mb-2" aria-label="5 out of 5 stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <footer class="blockquote-footer text-white-50 mt-3">
                        <strong>Ahmed Rahman</strong><br>
                        <small>Project Manager, Tech Solutions Ltd</small>
                    </footer>
                </div>

                <!-- Testimonial 2 -->
                <div class="testimonial">
                    <i class="fas fa-quote-left text-warning fa-2x mb-3"></i>
                    <p class="lead text-white">"Working with Kamrul was a pleasure. He communicates effectively and delivers high-quality code on time. Highly recommended!"</p>
                    <div class="stars mb-2" aria-label="4.5 out of 5 stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <footer class="blockquote-footer text-white-50 mt-3">
                        <strong>Sarah Johnson</strong><br>
                        <small>CEO, Digital Innovations</small>
                    </footer>
                </div>

                <!-- Testimonial 3 -->
                <div class="testimonial">
                    <i class="fas fa-quote-left text-warning fa-2x mb-3"></i>
                    <p class="lead text-white">"Kamrul's full-stack development skills helped us build a robust web application. His problem-solving approach is impressive."</p>
                    <div class="stars mb-2" aria-label="5 out of 5 stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <footer class="blockquote-footer text-white-50 mt-3">
                        <strong>Michael Chen</strong><br>
                        <small>CTO, StartupHub</small>
                    </footer>
                </div>
            </div>
        </div>
    </section>

    <!-- Professional Footer/Call to Action -->
    <footer class="professional-footer py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8">
<h2 style="color: white;">Ready to Build Something Amazing?</h2>
                    <p class="text-white-50 lead mb-4">
                        I'm passionate about turning ideas into reality through clean, efficient code and thoughtful design. 
                        Let's collaborate on your next project and create something exceptional together.
                    </p>
                    <div class="footer-stats d-flex flex-wrap gap-4 mb-4">
                        <div class="footer-stat">
                            <strong class="text-warning">15+</strong>
                            <small class="text-white-50 d-block">Projects</small>
                        </div>
                        <div class="footer-stat">
                            <strong class="text-warning">2+</strong>
                            <small class="text-white-50 d-block">Years</small>
                        </div>
                        <div class="footer-stat">
                            <strong class="text-warning">10+</strong>
                            <small class="text-white-50 d-block">Clients</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <div class="d-flex flex-column gap-3">
                        <a href="mailto:kamrulIslam@gmail.com" class="btn btn-light btn-lg footer-btn">
                            <i class="fas fa-envelope me-2"></i>Get In Touch
                        </a>
                        <a href="/Pages/Projects.aspx" class="btn btn-outline-light btn-lg footer-btn">
                            <i class="fas fa-eye me-2"></i>View My Work
                        </a>
                        <div class="social-links-footer mt-2">
                            <a href="https://github.com/kamrul" target="_blank" class="text-white me-3">
                                <i class="fab fa-github fa-lg"></i>
                            </a>
                            <a href="https://www.linkedin.com/in/kamrul" target="_blank" class="text-white me-3">
                                <i class="fab fa-linkedin fa-lg"></i>
                            </a>
                            <a href="mailto:kamrulIslam@gmail.com" class="text-white">
                                <i class="fas fa-envelope fa-lg"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="my-4 bg-white-50">
            <div class="row">
                <div class="col-md-6">
                    <p class="text-white-50 mb-0">&copy; 2024 Kamrul Islam. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p class="text-white-50 mb-0">Made with <i class="fas fa-heart text-danger"></i> in Bangladesh</p>
                </div>
            </div>
        </div>
    </footer>


    <!-- JavaScript for Animations and Interactions -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Animate Progress Bars on Scroll
            const skillsSection = document.getElementById("skills-section");
            const progressBars = document.querySelectorAll(".progress-bar");
            const counters = document.querySelectorAll(".counter");
            let skillsAnimated = false;
            let statsAnimated = false;

            function animateProgressBars() {
                const sectionTop = skillsSection.getBoundingClientRect().top;
                const screenHeight = window.innerHeight;

                if (!skillsAnimated && sectionTop < screenHeight - 100) {
                    progressBars.forEach(bar => {
                        const target = bar.getAttribute("data-progress");
                        bar.style.width = target + "%";
                    });
                    skillsAnimated = true;
                }
            }

            function animateCounters() {
                const statsSection = document.querySelector(".stats-grid");
                if (!statsSection) return;

                const sectionTop = statsSection.getBoundingClientRect().top;
                const screenHeight = window.innerHeight;

                if (!statsAnimated && sectionTop < screenHeight - 100) {
                    counters.forEach(counter => {
                        const target = parseInt(counter.getAttribute("data-target"));
                        let count = 0;
                        const increment = target / 50;

                        const timer = setInterval(() => {
                            count += increment;
                            if (count >= target) {
                                counter.textContent = target + (target > 10 ? "+" : "");
                                clearInterval(timer);
                            } else {
                                counter.textContent = Math.floor(count) + (target > 10 ? "+" : "");
                            }
                        }, 50);
                    });
                    statsAnimated = true;
                }
            }

            // Testimonial Slider
            const testimonials = document.querySelectorAll(".testimonial");
            let testimonialIndex = 0;

            function showNextTestimonial() {
                testimonials[testimonialIndex].classList.remove("active");
                testimonialIndex = (testimonialIndex + 1) % testimonials.length;
                testimonials[testimonialIndex].classList.add("active");
            }

            // Event Listeners
            window.addEventListener("scroll", () => {
                animateProgressBars();
                animateCounters();
            });

            // Initialize animations if sections are already in view
            animateProgressBars();
            animateCounters();

            // Start testimonial slider
            setInterval(showNextTestimonial, 4000);

            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });

            // Add loading animation to buttons
            document.querySelectorAll('.btn').forEach(btn => {
                btn.addEventListener('click', function (e) {
                    if (this.href && this.href.includes('mailto:')) {
                        return; // Don't add loading to email links
                    }

                    const originalText = this.innerHTML;
                    this.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Loading...';

                    setTimeout(() => {
                        this.innerHTML = originalText;
                    }, 2000);
                });
            });
        });
    </script>
    <style>
<style>
.hero-about {
    padding: 50px 20px;
    background-color: #f8f9fa;
    font-family: Arial, sans-serif;
}

.profile-card {
    display: flex;
    gap: 30px;
    max-width: 1000px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    flex-wrap: wrap;
}

/* Left Side (image + info) */
.profile-left {
    display: flex;
    flex-direction: column;
    align-items: center;
    min-width: 280px;
}

.profile-image img {
    width: 280px;
    height: 280px;
    object-fit: cover;
    border-radius: 50%;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    margin-bottom: 20px;
}

.profile-info {
    text-align: center;
}

.profile-info .name {
    margin: 0;
    font-size: 2rem;
    font-weight: bold;
}

.profile-info .title {
    margin: 5px 0 15px 0;
    font-size: 1.25rem;
    color: #555;
}

.profile-info .lead {
    margin-bottom: 15px;
    line-height: 1.6;
    color: #333;
}

.buttons {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    justify-content: center;
}

.btn {
    padding: 8px 16px;
    background-color: #667eea;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
}

.btn:hover {
    background-color: #556cd6;
}

.btn.btn-outline {
    background-color: transparent;
    color: #667eea;
    border: 2px solid #667eea;
}

.btn.btn-outline:hover {
    background-color: #667eea;
    color: #fff;
}

/* Right Side (about details) */
.about-details {
    flex: 1;
    min-width: 300px;
}

.about-details h4 {
    margin-top: 0;
    margin-bottom: 10px;
    color: #333;
}

.about-details p {
    margin-top: 0;
    margin-bottom: 20px;
    line-height: 1.6;
    color: #555;
}

/* Responsive */
@media (max-width: 768px) {
    .profile-card {
        flex-direction: column;
        align-items: center;
    }

    .about-details {
        text-align: center;
    }
}
</style>

</asp:Content>