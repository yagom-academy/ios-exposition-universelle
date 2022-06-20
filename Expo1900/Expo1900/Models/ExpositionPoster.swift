struct ExpositionPoster: Decodable {
    let title: String
    let description: String
    
    private let visitors: Int
    private let location: String
    private let duration: String
    
    // TODO: 방문객 숫자에 numberFormatter 적용하기
    var visitorContents: String {
        return "방문객 : \(visitors) 명"
    }
    
    var locationContents: String {
        return "개최지 : \(location)"
    }
    
    var durationContents: String {
        return "개최 기간 : \(duration)"
    }
}
