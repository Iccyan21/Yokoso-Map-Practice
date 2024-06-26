//
//  TermsView.swift
//  Yokoso-Map-Practice
//
//  Created by 水原　樹 on 2024/06/20.
//

import SwiftUI

struct TermsView: View {
    var body: some View {
        ScrollView {
            LazyVStack{
                Text("""
These Terms of Use (hereinafter referred to as the "Terms") set forth the terms of use for the services provided by the developer on this website (hereinafter referred to as the "Services"). All registered users (hereinafter referred to as Users) must use this Service in accordance with these Terms.

Article 1

(Application)
These Terms shall apply to all relationships between users and developers related to the use of this service. In addition to these Terms, the Developer may make various regulations regarding the Service, such as rules for use (hereinafter referred to as Individual Regulations). These individual provisions shall constitute a part of these Terms, regardless of their name. If the provisions of these Terms conflict with the provisions of the individual provisions in the preceding article, the provisions of the individual provisions shall take precedence unless otherwise specified in the individual provisions.

Article 2

(Registration for use)
In this service, a person who wishes to register will agree to these terms and apply for use registration according to the method specified by the developer, and the developer will approve this. By doing so, registration for use will be completed. If the developer determines that the applicant for usage registration has any of the following reasons, the developer may not approve the application for usage registration, and shall not be obligated to disclose any of the reasons. If false information is reported when applying for user registration; If the application is from a person who has violated these Terms; In addition, if the developer determines that the user registration is inappropriate

Article 3

(Management of user IDs and passwords)
Users shall appropriately manage their user IDs and passwords for this service at their own responsibility. Users may not transfer or lend their user ID and password to a third party, or share them with a third party under any circumstances. If a user logs in with a combination of user ID and password that matches the registered information, the developer will assume that the user ID is being used by the registered user. The Developer shall not be held responsible for any damage caused by the use of the User ID and Password by a third party, unless the Developer is intentionally or grossly negligent.

Article 4

(Usage Fees and Payment Methods)
Users shall specify the usage fees separately determined by the Developer and displayed on this website as consideration for the paid portion of the Service. Payment shall be made in the following manner. If the User is late in paying the usage fee, the User shall pay a delay fee at the rate of 14.6% per year.

Article 5

(Prohibited matters)
Users must not engage in the following acts when using this service.

Acts that violate laws or public order and morals
Acts related to criminal acts
Acts that infringe on the contents of this service,
Copyrights, trademark rights, and other intellectual property rights contained in this service
Acts of destroying or interfering with the functions of servers or networks of developers, other users, or other third parties
Acts of commercially using information obtained through this service
Acts that may interfere with the operation of the developer's services
Acts that make or attempt unauthorized access
Acts that collect or accumulate personal information, etc. about other users
Acts of using this service for illegal purposes
Acts that cause disadvantage, damage, or discomfort to other users of this service or other third parties
Other users Acts of impersonating someone
Promotion, advertising, solicitation, or sales activities on this service that are not authorized by the developer
Acts aimed at meeting a stranger of the opposite sex
The developer Acts that directly or indirectly provide benefits to antisocial forces in connection with the service
Other acts that the developer deems inappropriate

Article 7 (Restrictions on Use and Cancellation of Registration)

If the user falls under any of the following, the developer may not allow the user to use all or part of this service without prior notice. User registration may be restricted, or registration as a user may be canceled.

If you violate any of the provisions of these Terms
If it is discovered that there is a falsehood in the registered information
If you default in payment obligations such as fees
If there is no response for a certain period of time in response to a contact from the developer.
If this service has not been used for a certain period of time since the last use.
If the developer does not use this service appropriately. If determined
The developer will not be responsible for any damage caused to the user due to the developer's actions based on this article.

Compensation for damages caused to users due to default or illegal acts shall be limited to the amount of usage fees received from users in the month in which the damages occurred.

The developer is not responsible for any transactions, communications, or disputes that occur between users and other users or third parties regarding this service.

Article 10 (Changes to Service Content, etc.)

The developer may change, add, or abolish the content of this service with prior notice to the user, and the user shall consent to this.

Article 11 (Changes to Terms of Use)

The Developer may change these Terms of Use without requiring individual consent from users in the following cases.

When changes to these Terms are in the general interests of users.
When changes to these Terms do not contradict the purpose of this Service Use Agreement, and are reasonable in light of the necessity of the change, the appropriateness of the changed content, and other circumstances surrounding the change.
When changing the Terms of Use pursuant to the preceding paragraph, the Developer will notify the User in advance of the change to the Terms of Use, the content of the changed Terms of Use, and the effective date thereof.

Article 12 (Handling of Personal Information)

The Developer shall appropriately handle personal information obtained through the use of this Service in accordance with the Developer's Privacy Policy.

Article 13 (Notification or Communication)

Notification or communication between the User and the Developer shall be carried out by the method specified by the Developer. The developer shall assume that the currently registered contact information is valid and will notify or contact the contact information unless the user notifies the user of the change in accordance with the method specified separately by the developer. It is assumed that the information reaches the user at the same time.

Article 14 (Prohibition of Transfer of Rights and Obligations)

The User shall not transfer the status under the User Agreement or the rights or obligations under these Terms to a third party without the prior written consent of the Developer. It cannot be transferred or pledged as collateral.

Article 15 (Governing Law/Jurisdiction)

When interpreting these Terms, Japanese law shall be the governing law.

If a dispute arises regarding this service, the court having jurisdiction over the developer's head office location shall have exclusive jurisdiction.
"""
)
                
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle("Terms of service")
    }
}

#Preview {
    TermsView()
}
