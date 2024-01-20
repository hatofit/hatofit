import { Metadata } from "next";
import Link from "next/link";

// metadata
export const metadata: Metadata = {
  title: "Hatofit Privacy Policies",
  description:
    "Hatofit Privacy Policy - Learn how we collect, use, and protect your personal information in the Hatofit health and fitness application.",
  keywords: [
    "Hatofit",
    "privacy policy",
    "health app",
    "fitness app",
    "data protection",
    "personal information",
    "health data",
  ],
  applicationName: "Hatofit",
  authors: [
    {
      name: "Hatofit",
      url: "mailto:hatofit@gmail.com",
    },
  ],
};

export default function PrivacyPoliciesPage() {
  return (
    <>
      <section>
        <h2>1. Introduction</h2>
        <p>
          Welcome to Hatofit, a health and fitness application. This Privacy
          Policy explains how we collect, use, and safeguard your personal
          information.
        </p>
      </section>

      <section>
        <h2>2. Information We Collect</h2>
        <p>When you use Hatofit, we may collect the following information:</p>
        <ul>
          <li>
            <strong>Personal Information:</strong> Name, email, date of birth,
            weight, height, and profile photo.
          </li>
          <li>
            <strong>Health and Fitness Data:</strong> Real-time heart rate
            (connected from Polar H1o or Verity Sense), exercise data (recorded
            during workouts).
          </li>
        </ul>
      </section>

      <section>
        <h2>3. How We Use Your Information</h2>
        <p>We use the collected information for the following purposes:</p>
        <ul>
          <li>
            <strong>User Authentication and Account Management:</strong> To
            create and manage user accounts, allowing you to log in and use
            Hatofit.
          </li>
          <li>
            <strong>Real-time Display of Heart Rate:</strong> To provide you
            with real-time heart rate data during your workouts.
          </li>
          <li>
            <strong>Recording and Storing Exercise Data:</strong> To track and
            store data related to your exercises, enabling you to review your
            fitness progress.
          </li>
          <li>
            <strong>API Interaction:</strong> When you end an exercise, the app
            will request a POST method to an API for data retrieval and storage.
          </li>
          <li>
            <strong>Data Accessibility:</strong> Allowing users to access their
            health and fitness data from the mobile app or website.
          </li>
          <li>
            <strong>Optional Google Fit Integration:</strong> If you choose to
            connect Hatofit to Google Fit, additional health and fitness data
            may be processed as permitted by the Google Fit API. This
            integration is optional, and you can manage the permissions within
            the app settings.
          </li>
        </ul>
      </section>

      <section>
        <h2>4. Data Security</h2>
        <p>
          We take reasonable measures to protect your personal information,
          including your date of birth. This includes encryption, secure data
          storage, and access controls. However, no method of transmission over
          the internet or electronic storage is 100% secure.
        </p>
      </section>

      <section>
        <h2>5. Permissions</h2>
        <p>
          The Hatofit app requires the following permissions on your device, as
          described in the AndroidManifest.xml:
        </p>
        <ul>
          <li>
            <strong>INTERNET:</strong> Allows the app to access the internet for
            API communication.
          </li>
          <li>
            <strong>BLUETOOTH and BLUETOOTH_ADMIN (API 18-30):</strong> Required
            for Bluetooth connectivity with heart rate monitors.
          </li>
          <li>
            <strong>
              ACCESS_COARSE_LOCATION and ACCESS_FINE_LOCATION (API 23-30):
            </strong>{" "}
            Required for location-based permissions.
          </li>
          <li>
            <strong>BLUETOOTH_CONNECT and BLUETOOTH_SCAN (API 31+):</strong> New
            permissions for Bluetooth in API 31 and above.
          </li>
          <li>
            <strong>ACTIVITY_RECOGNITION:</strong> Allows the app to recognize
            the user's physical activity.
          </li>
          <li>
            <strong>
              Health-related Permissions (READ/WRITE_STEPS, READ/WRITE_WEIGHT,
              READ/WRITE_HEIGHT, READ/WRITE_HEART_RATE, READ/WRITE_SLEEP):
            </strong>{" "}
            Necessary for accessing health-related data.
          </li>
          <li>
            <strong></strong>
          </li>
        </ul>
        <p>
          These permissions are crucial for the proper functioning of the app
          and ensuring a seamless user experience.
        </p>
      </section>

      <section>
        <h2>6. Optional Google Fit Integration</h2>
        <p>
          If you choose to connect your Hatofit app to Google Fit, we may
          collect and process additional health and fitness data as permitted by
          the Google Fit API. This integration is optional, and you can manage
          the permissions within the app settings.
        </p>
      </section>

      <section>
        <h2>7. Changes to This Privacy Policy</h2>
        <p>
          We may update this Privacy Policy from time to time. You will be
          notified of any changes by reviewing the policy on our website or
          through the app. It is advisable to regularly check for updates to
          stay informed about how we are handling your personal information.
        </p>
      </section>

      <section>
        <h2>8. User Rights</h2>
        <p>As a user of Hatofit, you have the following rights:</p>
        <ul>
          <li>
            <strong>Access:</strong> You can request access to the personal
            information, including your date of birth, we hold about you.
          </li>
          <li>
            <strong>Correction:</strong> You can request corrections to any
            inaccurate or incomplete personal information, including your date
            of birth.
          </li>
          <li>
            <strong>Deletion:</strong> You can request the deletion of your
            personal information under certain circumstances.
          </li>
          <li>
            <strong>Portability:</strong> You can request the transfer of your
            personal information to another service or platform.
          </li>
          <li>
            <strong>Withdrawal of Consent:</strong> If you have provided consent
            for specific processing activities, you can withdraw that consent at
            any time.
          </li>
        </ul>
        <p>
          To exercise these rights or if you have any questions or concerns
          about our Privacy Policy, please contact us
          <Link href="mailto:hatofit@gmail.com" style={{ color: "blue" }}>
            Google e-Mail
          </Link>
        </p>
      </section>

      <section>
        <h2>9. Contact Us</h2>
        <p>
          If you have any questions or concerns about our Privacy Policy, please
          contact us at{" "}
          <Link href="mailto:hatofit@gmail.com" style={{ color: "blue" }}>
            Google e-Mail
          </Link>
        </p>
      </section>
    </>
  );
}
