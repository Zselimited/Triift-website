import { Mail, Phone } from 'lucide-react';

function InstagramIcon() {
  return (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <rect x="3" y="3" width="18" height="18" rx="5" stroke="currentColor" strokeWidth="1.5" />
      <circle cx="12" cy="12" r="4" stroke="currentColor" strokeWidth="1.5" />
      <circle cx="17.5" cy="6.5" r="1" fill="currentColor" />
    </svg>
  );
}

function LinkedInIcon() {
  return (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <rect x="3" y="3" width="18" height="18" rx="3" stroke="currentColor" strokeWidth="1.5" />
      <path d="M7 10v7M7 7.2v.1M11 17v-4.5c0-1.4 1-2.5 2.5-2.5s2.5 1.1 2.5 2.5V17" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
    </svg>
  );
}

function XIcon() {
  return (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <path d="M4 4l16 16M20 4L4 20" stroke="currentColor" strokeWidth="1.6" strokeLinecap="round" />
    </svg>
  );
}

function FacebookIcon() {
  return (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <path
        d="M15 8.5h-2c-.6 0-1 .4-1 1V12h3l-.4 3H12v7h-3v-7H7v-3h2V9.2C9 6.9 10.4 5.5 12.6 5.5H15v3z"
        stroke="currentColor"
        strokeWidth="1.4"
        strokeLinejoin="round"
      />
    </svg>
  );
}

export default function Footer() {
  const year = new Date().getFullYear();

  return (
    <footer className="site-footer">
      <div className="container">
        <div className="footer-grid">
          <div className="footer-brand">
            <a href="#home" className="brand">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src="/logo-white.png" alt="Triift Africa" className="brand-logo" style={{ height: 40 }} />
            </a>
            <p>Driving the growth of African businesses through community, training and resources.</p>
            <div className="footer-social">
              <a href="https://www.instagram.com/triiftafrica" target="_blank" rel="noopener noreferrer" aria-label="Triift Africa on Instagram">
                <InstagramIcon />
              </a>
              <a href="https://www.facebook.com/TriiftAfrica" target="_blank" rel="noopener noreferrer" aria-label="Triift Africa on Facebook">
                <FacebookIcon />
              </a>
              <a href="https://www.linkedin.com/company/triiftafrica/" target="_blank" rel="noopener noreferrer" aria-label="Triift Africa on LinkedIn">
                <LinkedInIcon />
              </a>
              <a href="https://x.com/triiftafrica" target="_blank" rel="noopener noreferrer" aria-label="Triift Africa on X">
                <XIcon />
              </a>
            </div>
          </div>

          <div className="footer-col">
            <h4>Explore</h4>
            <ul>
              <li><a href="#about">About us</a></li>
              <li><a href="#services">Services</a></li>
              <li><a href="#impact">Impact</a></li>
              <li><a href="#faqs">FAQs</a></li>
            </ul>
          </div>

          <div className="footer-col">
            <h4>Programs</h4>
            <ul>
              <li><a href="#services">START Accelerator</a></li>
              <li><a href="#resources">Business resources</a></li>
              <li><a href="https://docs.google.com/forms/d/e/1FAIpQLSfDVrqbojRBF49hPRM4cDkbDYJOYUhztw1yDjx4LX9ijh72Kw/alreadyresponded" target="_blank" rel="noopener noreferrer">Business community</a></li>
            </ul>
          </div>

          <div className="footer-col">
            <h4>Connect</h4>
            <ul>
              <li>
                <a href="mailto:triiftafrica@gmail.com" style={{ display: 'inline-flex', alignItems: 'center', gap: 8 }}>
                  <Mail size={15} /> triiftafrica@gmail.com
                </a>
              </li>
              <li>
                <a href="tel:+2349035333965" style={{ display: 'inline-flex', alignItems: 'center', gap: 8 }}>
                  <Phone size={15} /> 0903 533 3965
                </a>
              </li>
              <li><a href="https://medium.com/@triiftafrica" target="_blank" rel="noopener noreferrer">Medium</a></li>
              <li><a href="https://selar.com/m/TriiftAfrica" target="_blank" rel="noopener noreferrer">Selar</a></li>
            </ul>
          </div>
        </div>

        <div className="footer-bottom">
          <span>Copyright {year} Triift Africa. All rights reserved.</span>
          <span>Built for nano and micro business owners across Africa.</span>
        </div>
      </div>
    </footer>
  );
}
