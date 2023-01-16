//
//  DataProvider.swift
//  fodamy-baki
//
//  Created by Baki Dikbıyık on 16.01.2023.
//

#if DEBUG
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [APILogger.shared])
#else
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [])
#endif
