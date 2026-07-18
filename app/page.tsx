import Header from '@/components/Header';
import Hero from '@/components/Hero';
import TrustStrip from '@/components/TrustStrip';
import WeaveDivider from '@/components/WeaveDivider';
import About from '@/components/About';
import Services from '@/components/Services';
import Impact from '@/components/Impact';
import Testimonials from '@/components/Testimonials';
import CtaBanner from '@/components/CtaBanner';
import Resources from '@/components/Resources';
import Faq from '@/components/Faq';
import Contact from '@/components/Contact';
import Footer from '@/components/Footer';

export default function Home() {
  return (
    <>
      <Header />
      <Hero />
      <WeaveDivider />
      <TrustStrip />
      <About />
      <Services />
      <Impact />
      <Testimonials />
      <CtaBanner />
      <Resources />
      <Faq />
      <Contact />
      <Footer />
    </>
  );
}
