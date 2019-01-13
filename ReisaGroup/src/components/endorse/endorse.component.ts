import { Component } from '@angular/core';

@Component({
  selector: 'endorse',
  templateUrl: './endorse.component.html',
  styleUrls: ['./endorse.component.css']
})
export class EndorseComponent {
    endorsements = [
        {
            company: 'Chick-fil-A®:',
            qoute: "One of the reasons we have been able to select highly talented Staff and Operators is The Reisa Group's commitment to thoroughly referencing each candidate. Referencing is an integral part of the selection process and one that we hold very valuable in learning more about the people who desire to be associated with Chick-fil-A®. The Reisa Group deals with people in such a professional manner that it leaves a positive impression with them on Chick-fil-A® and the association we have with various business partners.",
            person: '- Vice President, Human Resources, Chick-fil-A®'
        },
        {
            company: 'Hagar USA:',
            qoute: "Our Board received exceptional customer support and professional counsel from Reisa in our search and selection for a new CEO. You and your staff were always timely and responsive to our requests, and in fact, many times were ahead of us in anticipating the next move. The results speak for themselves:   A thorough vetting of candidates, and selection of a top-notch CEO to lead us to our desired next level.  The cost was also very reasonable, an important factor for us.  Well done!",
            person: '- Chairman of the Board, Hagar USA'
        },
        {
            company: 'Foundation for Healthy Relationships:',
            qoute: "You did a masterful job referencing our Executive Director candidate!  I can't imagine hiring anyone without your services.",
            person: '- Chairman of the Board, Foundation for Healthy Relationships'
        },
        {
            company: 'Prison Fellowship:',
            qoute: "The Reisa Group is consistently professional, thorough, and efficient. The front end information gathering stage is in depth. Candidates presented are consistently on target. The entire process from initial position description to hire is impeccable.",
            person: '-  Director of HR Services, Prison Fellowship'
        },
        {
            company: 'Recently Hired:',
            qoute: 'I have had some experience with recruiters and I must say that you are unique.  Your professionalism and obvious enthusiasm in representing your client were quite evident not only to me but also to the individuals you called about me.',
            person: '- VP, Finance candidate'
        },
        {
            company: 'Knox Area Rescue Ministries:',
            qoute: 'I have relied on Betsy McCall and The Reisa Group for my ministry recruiting and leadership placement for about 10 years.  Betsy is easy to work with, thorough, insightful and timely in all her dealings with those I refer.  She is a professional in every sense of the word and represents us in excellent fashion to the candidates considering our organization.',
            person: '- President & Chief Executive Officer, Knox Area Rescue Ministries'
        },
        {
            company: 'Center for Arizona Policy:',
            qoute: 'We have been very pleased with your work.  You have been a blessing to us, allowing us to keep the ball rolling on the hiring process without it solely relying on our effort.  We also really benefited from your experience in interviewing candidates.  That is truly an art.',
            person: '- VP, Finance and Administration, Center for Arizona Policy'
        },
        {
            company: 'Leading The Way:',
            qoute: 'The hiring process often times can be a drain on resources and time.  Additionally, the pitfalls of hiring the wrong person for the task are especially hard on smaller and leaner organizations.  Since 1998 The Reisa Group has partnered with Leading The Way in ensuring that resources and time are maximized while at the same time getting the right person in place.',
            person: '- Executive Vice President, Leading The Way with Dr. Michael Youssef'
        },
        {
            company: 'Recently Hired:',
            qoute: 'I wish to thank you for your specialized recruiting.  I was curious about the extra care and professionalism shown to me and researched your organization.  It all makes sense to me now.  My previous experience with recruiters left me cold and skeptical.  Your organization should serve as a role model for others in the field.',
            person: '- IT Project Manager candidate'
        }
    ]
}