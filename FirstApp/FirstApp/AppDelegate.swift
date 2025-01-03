//
//  AppDelegate.swift
//  FirstApp
//
//  Created by 임윤휘 on 12/24/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // 앱이 백그라운드로 들어갈 때 실행되는 메서드
        // 유튜브 - 프리미엄을 결제한 경우 백그라운드에서 계속 재생
        // 결제 여부에 따라 작업 구분 필요, 이러한 조건 처리 시 함수 사용
        // 보안이 중요한 금융, 카카오톡 잠금
        // 백그라운드로 들어갈 때 화면이 안 보이고 로고가 보이도록
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // 다시 앱을 실행했을 때
        // 금융앱의 페이스 인증 다시, 잠금 해제 다시
        // 백그라운드로 갔다가 포그라운드로 왔을 때 유튜브의 프리미언 결제 유도 안내
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sleep(2)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

