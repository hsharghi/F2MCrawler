import XCTest

@testable import F2MCrawler
@testable import SwiftSoup


final class F2MCrawlerTests: XCTestCase {
    
    private var requestProvider: RequestProvider!
    
    override func setUp() {
        super.setUp()
        self.requestProvider = MockApiRequest()
    }
    
    func testInitPost() throws {
        (requestProvider as! MockApiRequest).setResponse(to: .value(Data(F2MCrawlerTests.postHTML.utf8), nil))
        requestProvider.request(from: "test") { (data, response, error) in
            let htmlString = String(data: data!, encoding: .utf8)
            do {
                let doc = try SwiftSoup.parseBodyFragment(htmlString!).body()
                let postElement = try doc?.select("div").first()
                let post = try MoviePost(element: postElement!)
                XCTAssertEqual(post.title, "Wuthering Heights 2009")
                XCTAssertEqual(post.format, .mkv)
                XCTAssertEqual(post.link, "https://www.f2m.site/8074/wuthering-heights-2009/")
                XCTAssertEqual(post.poster, "https://www.f2m.site/wp-content/uploads/2020/04/DvLqh-QXcAAqEvl5.jpg")
            } catch {
                print("error")
            }
        }
        
    }
    
    static let postHTML = """
            <div id=class="post">
            <div id="post-title">
            <h2><a href="https://www.f2m.site/8074/wuthering-heights-2009/" rel="bookmark" title="دانلود فیلم Wuthering Heights 2009">دانلود فیلم Wuthering Heights 2009</a></h2>
            <div id="post-info">
            <ul>
            <li class="date">9 جولای 2022</li>
            <li class="categry"><a href="https://www.f2m.site/category/film/" rel="category tag">دانلود فیلم</a>, <a href="https://www.f2m.site/category/film/%d8%af%d8%b1%d8%a7%d9%85/" rel="category tag">دانلود فیلم درام</a>, <a href="https://www.f2m.site/category/film/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c/" rel="category tag">دانلود فیلم دوبله فارسی</a>, <a href="https://www.f2m.site/category/film/%d8%b3%d8%a7%d9%84-%d9%87%d8%a7%db%8c-%d9%82%d8%a8%d9%84-%d8%aa%d8%b1/" rel="category tag">فیلم‌های سال 1930 تا 2009</a></li>
            </ul>
            <div class="clear"></div>
            </div></div>
            <div id="content" class="contentbox">
            <div class="txtbbb">
            <div class="txtbbb">
            <div style="background-color: #f3f3f3; color: #0088cc; font-size: 12px; text-align: right; width: 500px; margin-top: 1px;">
            <p style="text-align: center;"><span style="color: #800000;"><span style="color: #000000;"><strong><a href="https://www.f2m.site" target="_blank" rel="noopener noreferrer">دانلود فیلم</a> Wuthering Heights 2009</strong> با کیفیت <strong><span style="color: #ff0000;">BluRay 720p – 1080p<br>
            </span></strong></span></span></p>
            <div style="background-color: #5f4587; color: #ffffff; margin-bottom: 3px; text-align: center; font-size: 15px; direction: rtl;">نسخه دوبله فارسی</div>
            </div>
            <div style="background: #f3f3f3 none repeat scroll 0% 0%; height: 305px; width: 500px; text-align: right;">منتشر کننده فایل: <span style="color: #e2e2e2;"><a style="color: #ff6600;" href="https://www.f2m.site" target="_blank" rel="noopener noreferrer">Film2Media</a></span><br>
            ژانر : <span style="color: #fa5705;">درام</span><img id="myimg" class="alignleft" style="margin: 0px; padding: 8px; border: solid #CACACA; border-radius: 20px; background-color: #e2e2e2; border-width: 1.5px;" src="https://www.f2m.site/wp-content/uploads/2020/04/DvLqh-QXcAAqEvl5.jpg" alt="" width="180" height="280"><p></p>
            <div style="background: #00cccc none repeat scroll 0% 0%; width: 310px; height: 23px; margin: 0px; padding: 0px;"><img class="alignnone" style="vertical-align: middle;" src="https://www.f2m.site/wp-content/uploads/2019/02/imdb.png" alt=""><strong><span style="color: #ffffff;"> 7.5/10 از 9,135 رای<br>
            </span></strong></div>
            <p>زبان : English<br>
            کیفیت : BluRay 720p – 1080p <img loading="lazy" class="alignnone" src="https://www.f2m.site/wp-content/uploads/2019/02/5stars.gif" alt="" width="68" height="11"><br>
            فرمت : MKV<br>
            محصول : UK<br>
            ستارگان : <span style="color: #ff6600;">Tom Hardy, Charlotte Riley, Andrew Lincoln</span><br>
            کارگردان : <span style="color: #ff6600;">Coky Giedroyc</span></p>
            </div>
            <div style="background-color: #f3f3f3; color: #00ced1; font-size: 12px; text-align: right; width: 500px; margin-top: 5px;"><strong>خلاصه داستان :</strong></div>
            <div style="background-color: #f3f3f3; width: 500px; margin-top: 1px; text-align: justify;">بلندی های بادگیر؛ فیلمی دو قسمتی به کارگردانی کوکی گیدرویچ و با بازی تام هاردی است. “هیتکلیف” کودکی سر راهی توسط خانواده ثروتمند “ارنشاوز” در شهر یورک‌شر بزرگ می شود اما بعدها در زندگی خود کینه‌ای نسبت به خانواده به دل می گیرد…</div>
            </div>
            <p style="text-align: justify;">
            <br></p><p><strong><em><a href="https://www.f2m.site/8074/wuthering-heights-2009/" title="دانلود فیلم Wuthering Heights 2009" class="more-link"><strong> برای ادامه مطلب و دانلود کلیک کنید </strong></a></em></strong></p>
            </div>
            <div class="noghte-wbh">
            <h3><a href="https://www.f2m.site/tag/%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-2009-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" class="%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-2009-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" title="بلندی های بادگیر 2009 دوبله فارسی">بلندی های بادگیر 2009 دوبله فارسی</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" class="%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" title="بلندی های بادگیر دوبله فارسی">بلندی های بادگیر دوبله فارسی</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" title="دانلود بلندی های بادگیر دوبله فارسی">دانلود بلندی های بادگیر دوبله فارسی</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-%d9%81%db%8c%d9%84%d9%85-wuthering-heights" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-%d9%81%db%8c%d9%84%d9%85-wuthering-heights" title="دانلود دوبله فارسی فیلم Wuthering Heights">دانلود دوبله فارسی فیلم Wuthering Heights</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-%d9%81%db%8c%d9%84%d9%85-wuthering-heights-2009" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-%d9%81%db%8c%d9%84%d9%85-wuthering-heights-2009" title="دانلود دوبله فارسی فیلم Wuthering Heights 2009">دانلود دوبله فارسی فیلم Wuthering Heights 2009</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-%d9%81%db%8c%d9%84%d9%85-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-%d9%81%db%8c%d9%84%d9%85-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af" title="دانلود دوبله فارسی فیلم بلندی های بادگیر">دانلود دوبله فارسی فیلم بلندی های بادگیر</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%b3%d8%b1%db%8c%d8%a7%d9%84-wuthering-heights" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%b3%d8%b1%db%8c%d8%a7%d9%84-wuthering-heights" title="دانلود سریال Wuthering Heights">دانلود سریال Wuthering Heights</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-wuthering-heights-2009-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-wuthering-heights-2009-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" title="دانلود فیلم Wuthering Heights 2009 دوبله فارسی">دانلود فیلم Wuthering Heights 2009 دوبله فارسی</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-wuthering-heights-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-wuthering-heights-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" title="دانلود فیلم Wuthering Heights دوبله فارسی">دانلود فیلم Wuthering Heights دوبله فارسی</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-2009-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-2009-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7" title="دانلود فیلم بلندی های بادگیر 2009 دوبله فارسی">دانلود فیلم بلندی های بادگیر 2009 دوبله فارسی</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1" title="دانلود فیلم بلندی های بادگیر دوبله فارسی">دانلود فیلم بلندی های بادگیر دوبله فارسی</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-%d9%87%d8%a7%db%8c-%d8%aa%d8%a7%d9%85-%d9%87%d8%a7%d8%b1%d8%af%db%8c-tom-hardy" class="%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d9%81%db%8c%d9%84%d9%85-%d9%87%d8%a7%db%8c-%d8%aa%d8%a7%d9%85-%d9%87%d8%a7%d8%b1%d8%af%db%8c-tom-hardy" title="دانلود فیلم های تام هاردی Tom Hardy">دانلود فیلم های تام هاردی Tom Hardy</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-wuthering-heights" class="%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-wuthering-heights" title="دوبله فارسی Wuthering Heights">دوبله فارسی Wuthering Heights</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-wuthering-heights-2009" class="%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-wuthering-heights-2009" title="دوبله فارسی Wuthering Heights 2009">دوبله فارسی Wuthering Heights 2009</a> </h3> <h3><a href="https://www.f2m.site/tag/%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-2009" class="%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c-%d8%a8%d9%84%d9%86%d8%af%db%8c-%d9%87%d8%a7%db%8c-%d8%a8%d8%a7%d8%af%da%af%db%8c%d8%b1-2009" title="دوبله فارسی بلندی های بادگیر 2009">دوبله فارسی بلندی های بادگیر 2009</a> </h3> <h3><a href="https://www.f2m.site/tag/%d9%81%db%8c%d9%84%d9%85-wuthering-heights-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" class="%d9%81%db%8c%d9%84%d9%85-wuthering-heights-%d8%af%d9%88%d8%a8%d9%84%d9%87-%d9%81%d8%a7%d8%b1%d8%b3%db%8c" title="فیلم Wuthering Heights دوبله فارسی">فیلم Wuthering Heights دوبله فارسی</a> </h3> </div>
            </div>
            <div class="clear"></div>
            <div id="post-footer"></div>
            </div>
    """
    
}


class MockApiRequest: RequestProvider {

    public enum Response {
        case value(Data?, URLResponse?)
        case error(Error?)
    }

    private var response: Response?

    public init(response: Response? = nil) {
        self.response = response
    }

    public func setResponse(to response: Response) {
        self.response = response
    }
    
    public func request(from: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        switch response {
        case .value(let data, let response):
            completion(data, response, nil)
        case .error(let error):
            completion(nil, nil, error)
        case .none:
            return
        }
    }

}
