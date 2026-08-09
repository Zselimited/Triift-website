import Reveal from './Reveal';

const FAQS = [
  {
    q: 'What does Triift Africa help with?',
    a: 'We help nano and micro business owners grow through community, training and mentorship, and practical resources, without requiring any funding or financial product.',
  },
  {
    q: 'What is the Triift Community?',
    a: 'A network of entrepreneurs, mentors, and growth partners working together to build successful African businesses. Members get access to training, opportunities, and exclusive resources, with a paid tier for additional support.',
  },
  {
    q: 'How can I join the community?',
    a: 'Sign up through our website. Once you register, you will receive the link to join our WhatsApp community and get updates on programs and events.',
  },
  {
    q: 'Is Triift Africa only for Nigerians?',
    a: 'Not at all. While many of our programs started in Nigeria, we are expanding across Africa, with members in Ghana, Malawi, and beyond.',
  },
  {
    q: 'I am an organization interested in partnering with Triift. How can I get involved?',
    a: 'We collaborate with corporate brands, NGOs, development agencies, and government bodies that want to support small businesses. Email us at triiftafrica@gmail.com to get started.',
  },
];

export default function Faq() {
  return (
    <section className="section-tint" id="faqs" style={{ paddingTop: 0, paddingBottom: 'var(--space-section)' }}>
      <div className="container">
        <Reveal className="section-head">
          <span className="eyebrow">Frequently asked questions</span>
          <h2>Everything you might want to know</h2>
        </Reveal>

        <Reveal className="faq-list">
          {FAQS.map((item) => (
            <details className="faq-item" key={item.q}>
              <summary>
                {item.q}
                <span className="faq-icon" aria-hidden="true" />
              </summary>
              <div className="faq-answer">{item.a}</div>
            </details>
          ))}
        </Reveal>
      </div>
    </section>
  );
}
