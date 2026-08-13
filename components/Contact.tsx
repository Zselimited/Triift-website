'use client';

import { useState, type FormEvent } from 'react';
import Reveal from './Reveal';

export default function Contact() {
  const [status, setStatus] = useState<'idle' | 'sending' | 'sent' | 'error'>('idle');

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const form = event.currentTarget;
    const formData = new FormData(form);

    setStatus('sending');
    try {
      const response = await fetch('https://formsubmit.co/ajax/ba334aace1649d99025aa099b4f90743', {
        method: 'POST',
        headers: { Accept: 'application/json' },
        body: formData,
      });
      if (!response.ok) throw new Error('Request failed');
      setStatus('sent');
      form.reset();
    } catch {
      setStatus('error');
    }
    setTimeout(() => setStatus('idle'), 5000);
  }

  return (
    <section className="section-pad section-purple" id="contact">
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">Contact us</span>
          <h2>
            Let us talk about <em>your growth</em>
          </h2>
          <p>Have a question, a partnership idea, or ready to apply? Reach out, we reply fast.</p>
        </Reveal>

        <div className="contact-grid">
          <Reveal>
            <form onSubmit={handleSubmit}>
              <input type="hidden" name="_subject" value="New message from the Triift Africa website" />
              <input type="hidden" name="_template" value="table" />
              <input type="hidden" name="_captcha" value="false" />

              <div className="form-field">
                <label htmlFor="cf-name">Full name</label>
                <input id="cf-name" name="name" type="text" placeholder="Your name" required />
              </div>
              <div className="form-field">
                <label htmlFor="cf-email">Email address</label>
                <input id="cf-email" name="email" type="email" placeholder="you@example.com" required />
              </div>
              <div className="form-field">
                <label htmlFor="cf-message">Message</label>
                <textarea id="cf-message" name="message" placeholder="Tell us about your business and how we can help" required />
              </div>
              <button className="btn btn-primary" type="submit" disabled={status === 'sending' || status === 'sent'}>
                {status === 'sending' ? 'Sending...' : status === 'sent' ? 'Message sent' : 'Send message'}
              </button>
              {status === 'error' && (
                <p className="form-note">Something went wrong sending your message. Please try again, or email us directly.</p>
              )}
            </form>
          </Reveal>

          <Reveal delay={0.1}>
            <div className="contact-card">
              <div className="contact-row">
                <span className="icon" aria-hidden="true">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
                    <path d="M3 5h18v14H3zM3 6l9 7 9-7" stroke="currentColor" strokeWidth="1.4" />
                  </svg>
                </span>
                <div>
                  <span className="label">Email</span>
                  <a href="mailto:triiftafrica@gmail.com">triiftafrica@gmail.com</a>
                </div>
              </div>
              <div className="contact-row">
                <span className="icon" aria-hidden="true">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
                    <path
                      d="M4 4h4l2 5-2.5 1.5a12 12 0 006 6L15 14l5 2v4a2 2 0 01-2 2C9.5 22 2 14.5 2 6a2 2 0 012-2z"
                      stroke="currentColor"
                      strokeWidth="1.3"
                    />
                  </svg>
                </span>
                <div>
                  <span className="label">Phone</span>
                  <a href="tel:+2349035333965">0903 533 3965</a>
                </div>
              </div>
              <div className="contact-row">
                <span className="icon" aria-hidden="true">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
                    <circle cx="12" cy="12" r="9" stroke="currentColor" strokeWidth="1.4" />
                  </svg>
                </span>
                <div>
                  <span className="label">Where we operate</span>
                  <span className="val">Nigeria and 5 more African countries</span>
                </div>
              </div>
              <div className="contact-row">
                <span className="icon" aria-hidden="true">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none">
                    <path d="M12 3v18M3 12h18" stroke="currentColor" strokeWidth="1.4" />
                  </svg>
                </span>
                <div>
                  <span className="label">Partnerships</span>
                  <span className="val">triiftafrica@gmail.com</span>
                </div>
              </div>
            </div>
          </Reveal>
        </div>
      </div>
    </section>
  );
}
