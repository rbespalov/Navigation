
import XCTest


final class NavigationTests: XCTestCase {


    func testNetworkManager() {
        
        // arrange
        let downLoadExpectation = expectation(description: "DownLoadExpectation")
        let downloadManager = GetTitleManagerForTest()
        
        // act
        var completionResult: String?
        downloadManager.getTitle{ title in
            completionResult = title
            downLoadExpectation.fulfill()
        }

        wait(for: [downLoadExpectation], timeout: 5)
        
        // assert
        XCTAssertNotNil(completionResult)
        XCTAssertNotEqual(completionResult, "")
    }
    
    func testMakeVC() {
        
        // arrange
        let assembly = Assembly()

        // act
        let testVC = assembly.createFeedVC()

        // assert
        XCTAssertNotNil(testVC)
    }
    
    func testMakePostVC() {
        
        // arrange
        let feedVC = FeedViewControllerForTest()
        
        // act
        let postVC: () = feedVC.showPost()
        
        // assert
        XCTAssertNotNil(postVC)
    }
    
}
