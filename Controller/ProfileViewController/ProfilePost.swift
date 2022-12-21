

import UIKit

struct ProfilePost {
    
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    
}

extension ProfilePost {
    
    static func make() -> [ProfilePost] {
        [
            ProfilePost(
                author: "Slipknot - IOWA",
                description: "iowa is the second studio album by the American heavy metal band Slipknot. Released by Roadrunner Records on August 28, 2001, it was produced by Ross Robinson and Slipknot. The title derives from the bands home state, Iowa, which members have stated is one of their greatest sources of inspiration.",
                image: "slipknot",
                likes: 2342,
                views: 9128
            ),
            ProfilePost(
                author: "In Flames - Soundtrack to Your Escape",
                description: "Soundtrack to Your Escape is the seventh studio album of Swedish metal band In Flames, released on 29 March 2004. The album was criticized by longtime fans because of a major change in musical style. However, the album was seen by many as a natural progression from Reroute to Remain and was critically praised by critics such as Metal Hammer and Kerrang!. It reached number 3 in Sweden, number 45 on the American Billboard 200 chart (the band's first album to reach the Billboard 200), number 2 on the Top Heatseekers chart, and number 7 on the Independent Albums chart.",
                image: "inflames",
                likes: 1361,
                views: 6534
            ),
            ProfilePost(
                author: "Lorna Shore - And I Return to Nothingness",
                description: "On June 11, 2021, the band returned with a new song titled To the Hellfire, and announced Ramos as their new permanent vocalist. They also announced details of their new EP; ...And I Return to Nothingness.[20] It is the band’s first EP since their breakthrough 2013 release Maleficium.",
                image: "lornashore",
                likes: 3922,
                views: 12392
            ),
            ProfilePost(
                author: "The Offspring - Conspiracy of One",
                description: "Conspiracy of One is the sixth studio album by American rock band the Offspring, released on November 14, 2000, by Columbia Records. By the time of its release, the band had come out in support of peer-to-peer file sharing, claiming it would not hurt sales. Conspiracy of One was originally planned to be released directly on their website before retail, until Columbia Records threatened to sue and the album ended up as a physical release. The album was the last to feature drummer Ron Welty, who left the band in early 2003 to pursue his career with Steady Ground.",
                image: "theoffspring",
                likes: 4530, views: 8342
            ),
        ]
    }
}
