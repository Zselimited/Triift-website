export default function TrustStrip() {
  const partners = ['British Council', 'She Leads Africa', 'iSafe Consulting'];

  return (
    <div className="trust-strip">
      <div className="container">
        <span className="trust-label">Trusted by, partnered with</span>
        <div className="trust-logos">
          {partners.map((name) => (
            <span key={name}>{name}</span>
          ))}
        </div>
      </div>
    </div>
  );
}
