// This file is autogenerated. Take a look at `Preprocessor` target in RxSwift project
//
//  Zip+arity.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 5/23/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation



// 2

extension Observable {
    /**
    Merges the specified observable sequences into one observable sequence by using the selector function whenever all of the observable sequences have produced an element at a corresponding index.

    - seealso: [zip operator on reactivex.io](http://reactivex.io/documentation/operators/zip.html)

    - parameter resultSelector: Function to invoke for each series of elements at corresponding indexes in the sources.
    - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
    */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public static func zip<O1: ObservableType, O2: ObservableType>
        (_ source1: O1, _ source2: O2, resultSelector: @escaping (O1.E, O2.E) throws -> E)
        -> Observable<E> {
        return Zip2(
            source1: source1.asObservable(), source2: source2.asObservable(),
            resultSelector: resultSelector
        )
    }
}

class ZipSink2_<E1, E2, O: ObserverType> : ZipSink<O> {
    typealias R = O.E
    typealias Parent = Zip2<E1, E2, R>

    let _parent: Parent

    var _values1: Queue<E1> = Queue(capacity: 2)
    var _values2: Queue<E2> = Queue(capacity: 2)

    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(arity: 2, observer: observer)
    }

    override func hasElements(_ index: Int) -> Bool {
        switch (index) {
        case 0: return _values1.count > 0
        case 1: return _values2.count > 0

        default:
            rxFatalError("Unhandled case (Function)")
        }

        return false
    }

    func run() -> Disposable {
        let subscription1 = SingleAssignmentDisposable()
        let subscription2 = SingleAssignmentDisposable()

        let observer1 = ZipObserver(lock: _lock, parent: self, index: 0, setNextValue: { self._values1.enqueue($0) }, this: subscription1)
        let observer2 = ZipObserver(lock: _lock, parent: self, index: 1, setNextValue: { self._values2.enqueue($0) }, this: subscription2)

        subscription1.disposable = _parent.source1.subscribe(observer1)
        subscription2.disposable = _parent.source2.subscribe(observer2)

        return Disposables.create([
           subscription1,
           subscription2
        ])
    }

    override func getResult() throws -> R {
        return try _parent._resultSelector(_values1.dequeue()!, _values2.dequeue()!)
    }
}

class Zip2<E1, E2, R> : Producer<R> {
    typealias ResultSelector = (E1, E2) throws -> R

    let source1: Observable<E1>
    let source2: Observable<E2>

    let _resultSelector: ResultSelector

    init(source1: Observable<E1>, source2: Observable<E2>, resultSelector: ResultSelector) {
        self.source1 = source1
        self.source2 = source2

        _resultSelector = resultSelector
    }

    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == R {
        let sink = ZipSink2_(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
    }
}



// 3

extension Observable {
    /**
    Merges the specified observable sequences into one observable sequence by using the selector function whenever all of the observable sequences have produced an element at a corresponding index.

    - seealso: [zip operator on reactivex.io](http://reactivex.io/documentation/operators/zip.html)

    - parameter resultSelector: Function to invoke for each series of elements at corresponding indexes in the sources.
    - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
    */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public static func zip<O1: ObservableType, O2: ObservableType, O3: ObservableType>
        (_ source1: O1, _ source2: O2, _ source3: O3, resultSelector: @escaping (O1.E, O2.E, O3.E) throws -> E)
        -> Observable<E> {
        return Zip3(
            source1: source1.asObservable(), source2: source2.asObservable(), source3: source3.asObservable(),
            resultSelector: resultSelector
        )
    }
}

class ZipSink3_<E1, E2, E3, O: ObserverType> : ZipSink<O> {
    typealias R = O.E
    typealias Parent = Zip3<E1, E2, E3, R>

    let _parent: Parent

    var _values1: Queue<E1> = Queue(capacity: 2)
    var _values2: Queue<E2> = Queue(capacity: 2)
    var _values3: Queue<E3> = Queue(capacity: 2)

    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(arity: 3, observer: observer)
    }

    override func hasElements(_ index: Int) -> Bool {
        switch (index) {
        case 0: return _values1.count > 0
        case 1: return _values2.count > 0
        case 2: return _values3.count > 0

        default:
            rxFatalError("Unhandled case (Function)")
        }

        return false
    }

    func run() -> Disposable {
        let subscription1 = SingleAssignmentDisposable()
        let subscription2 = SingleAssignmentDisposable()
        let subscription3 = SingleAssignmentDisposable()

        let observer1 = ZipObserver(lock: _lock, parent: self, index: 0, setNextValue: { self._values1.enqueue($0) }, this: subscription1)
        let observer2 = ZipObserver(lock: _lock, parent: self, index: 1, setNextValue: { self._values2.enqueue($0) }, this: subscription2)
        let observer3 = ZipObserver(lock: _lock, parent: self, index: 2, setNextValue: { self._values3.enqueue($0) }, this: subscription3)

        subscription1.disposable = _parent.source1.subscribe(observer1)
        subscription2.disposable = _parent.source2.subscribe(observer2)
        subscription3.disposable = _parent.source3.subscribe(observer3)

        return Disposables.create([
           subscription1,
           subscription2,
           subscription3
        ])
    }

    override func getResult() throws -> R {
        return try _parent._resultSelector(_values1.dequeue()!, _values2.dequeue()!, _values3.dequeue()!)
    }
}

class Zip3<E1, E2, E3, R> : Producer<R> {
    typealias ResultSelector = (E1, E2, E3) throws -> R

    let source1: Observable<E1>
    let source2: Observable<E2>
    let source3: Observable<E3>

    let _resultSelector: ResultSelector

    init(source1: Observable<E1>, source2: Observable<E2>, source3: Observable<E3>, resultSelector: ResultSelector) {
        self.source1 = source1
        self.source2 = source2
        self.source3 = source3

        _resultSelector = resultSelector
    }

    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == R {
        let sink = ZipSink3_(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
    }
}



// 4

extension Observable {
    /**
    Merges the specified observable sequences into one observable sequence by using the selector function whenever all of the observable sequences have produced an element at a corresponding index.

    - seealso: [zip operator on reactivex.io](http://reactivex.io/documentation/operators/zip.html)

    - parameter resultSelector: Function to invoke for each series of elements at corresponding indexes in the sources.
    - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
    */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public static func zip<O1: ObservableType, O2: ObservableType, O3: ObservableType, O4: ObservableType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, resultSelector: @escaping (O1.E, O2.E, O3.E, O4.E) throws -> E)
        -> Observable<E> {
        return Zip4(
            source1: source1.asObservable(), source2: source2.asObservable(), source3: source3.asObservable(), source4: source4.asObservable(),
            resultSelector: resultSelector
        )
    }
}

class ZipSink4_<E1, E2, E3, E4, O: ObserverType> : ZipSink<O> {
    typealias R = O.E
    typealias Parent = Zip4<E1, E2, E3, E4, R>

    let _parent: Parent

    var _values1: Queue<E1> = Queue(capacity: 2)
    var _values2: Queue<E2> = Queue(capacity: 2)
    var _values3: Queue<E3> = Queue(capacity: 2)
    var _values4: Queue<E4> = Queue(capacity: 2)

    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(arity: 4, observer: observer)
    }

    override func hasElements(_ index: Int) -> Bool {
        switch (index) {
        case 0: return _values1.count > 0
        case 1: return _values2.count > 0
        case 2: return _values3.count > 0
        case 3: return _values4.count > 0

        default:
            rxFatalError("Unhandled case (Function)")
        }

        return false
    }

    func run() -> Disposable {
        let subscription1 = SingleAssignmentDisposable()
        let subscription2 = SingleAssignmentDisposable()
        let subscription3 = SingleAssignmentDisposable()
        let subscription4 = SingleAssignmentDisposable()

        let observer1 = ZipObserver(lock: _lock, parent: self, index: 0, setNextValue: { self._values1.enqueue($0) }, this: subscription1)
        let observer2 = ZipObserver(lock: _lock, parent: self, index: 1, setNextValue: { self._values2.enqueue($0) }, this: subscription2)
        let observer3 = ZipObserver(lock: _lock, parent: self, index: 2, setNextValue: { self._values3.enqueue($0) }, this: subscription3)
        let observer4 = ZipObserver(lock: _lock, parent: self, index: 3, setNextValue: { self._values4.enqueue($0) }, this: subscription4)

        subscription1.disposable = _parent.source1.subscribe(observer1)
        subscription2.disposable = _parent.source2.subscribe(observer2)
        subscription3.disposable = _parent.source3.subscribe(observer3)
        subscription4.disposable = _parent.source4.subscribe(observer4)

        return Disposables.create([
           subscription1,
           subscription2,
           subscription3,
           subscription4
        ])
    }

    override func getResult() throws -> R {
        return try _parent._resultSelector(_values1.dequeue()!, _values2.dequeue()!, _values3.dequeue()!, _values4.dequeue()!)
    }
}

class Zip4<E1, E2, E3, E4, R> : Producer<R> {
    typealias ResultSelector = (E1, E2, E3, E4) throws -> R

    let source1: Observable<E1>
    let source2: Observable<E2>
    let source3: Observable<E3>
    let source4: Observable<E4>

    let _resultSelector: ResultSelector

    init(source1: Observable<E1>, source2: Observable<E2>, source3: Observable<E3>, source4: Observable<E4>, resultSelector: ResultSelector) {
        self.source1 = source1
        self.source2 = source2
        self.source3 = source3
        self.source4 = source4

        _resultSelector = resultSelector
    }

    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == R {
        let sink = ZipSink4_(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
    }
}



// 5

extension Observable {
    /**
    Merges the specified observable sequences into one observable sequence by using the selector function whenever all of the observable sequences have produced an element at a corresponding index.

    - seealso: [zip operator on reactivex.io](http://reactivex.io/documentation/operators/zip.html)

    - parameter resultSelector: Function to invoke for each series of elements at corresponding indexes in the sources.
    - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
    */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public static func zip<O1: ObservableType, O2: ObservableType, O3: ObservableType, O4: ObservableType, O5: ObservableType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5, resultSelector: @escaping (O1.E, O2.E, O3.E, O4.E, O5.E) throws -> E)
        -> Observable<E> {
        return Zip5(
            source1: source1.asObservable(), source2: source2.asObservable(), source3: source3.asObservable(), source4: source4.asObservable(), source5: source5.asObservable(),
            resultSelector: resultSelector
        )
    }
}

class ZipSink5_<E1, E2, E3, E4, E5, O: ObserverType> : ZipSink<O> {
    typealias R = O.E
    typealias Parent = Zip5<E1, E2, E3, E4, E5, R>

    let _parent: Parent

    var _values1: Queue<E1> = Queue(capacity: 2)
    var _values2: Queue<E2> = Queue(capacity: 2)
    var _values3: Queue<E3> = Queue(capacity: 2)
    var _values4: Queue<E4> = Queue(capacity: 2)
    var _values5: Queue<E5> = Queue(capacity: 2)

    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(arity: 5, observer: observer)
    }

    override func hasElements(_ index: Int) -> Bool {
        switch (index) {
        case 0: return _values1.count > 0
        case 1: return _values2.count > 0
        case 2: return _values3.count > 0
        case 3: return _values4.count > 0
        case 4: return _values5.count > 0

        default:
            rxFatalError("Unhandled case (Function)")
        }

        return false
    }

    func run() -> Disposable {
        let subscription1 = SingleAssignmentDisposable()
        let subscription2 = SingleAssignmentDisposable()
        let subscription3 = SingleAssignmentDisposable()
        let subscription4 = SingleAssignmentDisposable()
        let subscription5 = SingleAssignmentDisposable()

        let observer1 = ZipObserver(lock: _lock, parent: self, index: 0, setNextValue: { self._values1.enqueue($0) }, this: subscription1)
        let observer2 = ZipObserver(lock: _lock, parent: self, index: 1, setNextValue: { self._values2.enqueue($0) }, this: subscription2)
        let observer3 = ZipObserver(lock: _lock, parent: self, index: 2, setNextValue: { self._values3.enqueue($0) }, this: subscription3)
        let observer4 = ZipObserver(lock: _lock, parent: self, index: 3, setNextValue: { self._values4.enqueue($0) }, this: subscription4)
        let observer5 = ZipObserver(lock: _lock, parent: self, index: 4, setNextValue: { self._values5.enqueue($0) }, this: subscription5)

        subscription1.disposable = _parent.source1.subscribe(observer1)
        subscription2.disposable = _parent.source2.subscribe(observer2)
        subscription3.disposable = _parent.source3.subscribe(observer3)
        subscription4.disposable = _parent.source4.subscribe(observer4)
        subscription5.disposable = _parent.source5.subscribe(observer5)

        return Disposables.create([
           subscription1,
           subscription2,
           subscription3,
           subscription4,
           subscription5
        ])
    }

    override func getResult() throws -> R {
        return try _parent._resultSelector(_values1.dequeue()!, _values2.dequeue()!, _values3.dequeue()!, _values4.dequeue()!, _values5.dequeue()!)
    }
}

class Zip5<E1, E2, E3, E4, E5, R> : Producer<R> {
    typealias ResultSelector = (E1, E2, E3, E4, E5) throws -> R

    let source1: Observable<E1>
    let source2: Observable<E2>
    let source3: Observable<E3>
    let source4: Observable<E4>
    let source5: Observable<E5>

    let _resultSelector: ResultSelector

    init(source1: Observable<E1>, source2: Observable<E2>, source3: Observable<E3>, source4: Observable<E4>, source5: Observable<E5>, resultSelector: ResultSelector) {
        self.source1 = source1
        self.source2 = source2
        self.source3 = source3
        self.source4 = source4
        self.source5 = source5

        _resultSelector = resultSelector
    }

    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == R {
        let sink = ZipSink5_(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
    }
}



// 6

extension Observable {
    /**
    Merges the specified observable sequences into one observable sequence by using the selector function whenever all of the observable sequences have produced an element at a corresponding index.

    - seealso: [zip operator on reactivex.io](http://reactivex.io/documentation/operators/zip.html)

    - parameter resultSelector: Function to invoke for each series of elements at corresponding indexes in the sources.
    - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
    */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public static func zip<O1: ObservableType, O2: ObservableType, O3: ObservableType, O4: ObservableType, O5: ObservableType, O6: ObservableType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5, _ source6: O6, resultSelector: @escaping (O1.E, O2.E, O3.E, O4.E, O5.E, O6.E) throws -> E)
        -> Observable<E> {
        return Zip6(
            source1: source1.asObservable(), source2: source2.asObservable(), source3: source3.asObservable(), source4: source4.asObservable(), source5: source5.asObservable(), source6: source6.asObservable(),
            resultSelector: resultSelector
        )
    }
}

class ZipSink6_<E1, E2, E3, E4, E5, E6, O: ObserverType> : ZipSink<O> {
    typealias R = O.E
    typealias Parent = Zip6<E1, E2, E3, E4, E5, E6, R>

    let _parent: Parent

    var _values1: Queue<E1> = Queue(capacity: 2)
    var _values2: Queue<E2> = Queue(capacity: 2)
    var _values3: Queue<E3> = Queue(capacity: 2)
    var _values4: Queue<E4> = Queue(capacity: 2)
    var _values5: Queue<E5> = Queue(capacity: 2)
    var _values6: Queue<E6> = Queue(capacity: 2)

    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(arity: 6, observer: observer)
    }

    override func hasElements(_ index: Int) -> Bool {
        switch (index) {
        case 0: return _values1.count > 0
        case 1: return _values2.count > 0
        case 2: return _values3.count > 0
        case 3: return _values4.count > 0
        case 4: return _values5.count > 0
        case 5: return _values6.count > 0

        default:
            rxFatalError("Unhandled case (Function)")
        }

        return false
    }

    func run() -> Disposable {
        let subscription1 = SingleAssignmentDisposable()
        let subscription2 = SingleAssignmentDisposable()
        let subscription3 = SingleAssignmentDisposable()
        let subscription4 = SingleAssignmentDisposable()
        let subscription5 = SingleAssignmentDisposable()
        let subscription6 = SingleAssignmentDisposable()

        let observer1 = ZipObserver(lock: _lock, parent: self, index: 0, setNextValue: { self._values1.enqueue($0) }, this: subscription1)
        let observer2 = ZipObserver(lock: _lock, parent: self, index: 1, setNextValue: { self._values2.enqueue($0) }, this: subscription2)
        let observer3 = ZipObserver(lock: _lock, parent: self, index: 2, setNextValue: { self._values3.enqueue($0) }, this: subscription3)
        let observer4 = ZipObserver(lock: _lock, parent: self, index: 3, setNextValue: { self._values4.enqueue($0) }, this: subscription4)
        let observer5 = ZipObserver(lock: _lock, parent: self, index: 4, setNextValue: { self._values5.enqueue($0) }, this: subscription5)
        let observer6 = ZipObserver(lock: _lock, parent: self, index: 5, setNextValue: { self._values6.enqueue($0) }, this: subscription6)

        subscription1.disposable = _parent.source1.subscribe(observer1)
        subscription2.disposable = _parent.source2.subscribe(observer2)
        subscription3.disposable = _parent.source3.subscribe(observer3)
        subscription4.disposable = _parent.source4.subscribe(observer4)
        subscription5.disposable = _parent.source5.subscribe(observer5)
        subscription6.disposable = _parent.source6.subscribe(observer6)

        return Disposables.create([
           subscription1,
           subscription2,
           subscription3,
           subscription4,
           subscription5,
           subscription6
        ])
    }

    override func getResult() throws -> R {
        return try _parent._resultSelector(_values1.dequeue()!, _values2.dequeue()!, _values3.dequeue()!, _values4.dequeue()!, _values5.dequeue()!, _values6.dequeue()!)
    }
}

class Zip6<E1, E2, E3, E4, E5, E6, R> : Producer<R> {
    typealias ResultSelector = (E1, E2, E3, E4, E5, E6) throws -> R

    let source1: Observable<E1>
    let source2: Observable<E2>
    let source3: Observable<E3>
    let source4: Observable<E4>
    let source5: Observable<E5>
    let source6: Observable<E6>

    let _resultSelector: ResultSelector

    init(source1: Observable<E1>, source2: Observable<E2>, source3: Observable<E3>, source4: Observable<E4>, source5: Observable<E5>, source6: Observable<E6>, resultSelector: ResultSelector) {
        self.source1 = source1
        self.source2 = source2
        self.source3 = source3
        self.source4 = source4
        self.source5 = source5
        self.source6 = source6

        _resultSelector = resultSelector
    }

    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == R {
        let sink = ZipSink6_(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
    }
}



// 7

extension Observable {
    /**
    Merges the specified observable sequences into one observable sequence by using the selector function whenever all of the observable sequences have produced an element at a corresponding index.

    - seealso: [zip operator on reactivex.io](http://reactivex.io/documentation/operators/zip.html)

    - parameter resultSelector: Function to invoke for each series of elements at corresponding indexes in the sources.
    - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
    */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public static func zip<O1: ObservableType, O2: ObservableType, O3: ObservableType, O4: ObservableType, O5: ObservableType, O6: ObservableType, O7: ObservableType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5, _ source6: O6, _ source7: O7, resultSelector: @escaping (O1.E, O2.E, O3.E, O4.E, O5.E, O6.E, O7.E) throws -> E)
        -> Observable<E> {
        return Zip7(
            source1: source1.asObservable(), source2: source2.asObservable(), source3: source3.asObservable(), source4: source4.asObservable(), source5: source5.asObservable(), source6: source6.asObservable(), source7: source7.asObservable(),
            resultSelector: resultSelector
        )
    }
}

class ZipSink7_<E1, E2, E3, E4, E5, E6, E7, O: ObserverType> : ZipSink<O> {
    typealias R = O.E
    typealias Parent = Zip7<E1, E2, E3, E4, E5, E6, E7, R>

    let _parent: Parent

    var _values1: Queue<E1> = Queue(capacity: 2)
    var _values2: Queue<E2> = Queue(capacity: 2)
    var _values3: Queue<E3> = Queue(capacity: 2)
    var _values4: Queue<E4> = Queue(capacity: 2)
    var _values5: Queue<E5> = Queue(capacity: 2)
    var _values6: Queue<E6> = Queue(capacity: 2)
    var _values7: Queue<E7> = Queue(capacity: 2)

    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(arity: 7, observer: observer)
    }

    override func hasElements(_ index: Int) -> Bool {
        switch (index) {
        case 0: return _values1.count > 0
        case 1: return _values2.count > 0
        case 2: return _values3.count > 0
        case 3: return _values4.count > 0
        case 4: return _values5.count > 0
        case 5: return _values6.count > 0
        case 6: return _values7.count > 0

        default:
            rxFatalError("Unhandled case (Function)")
        }

        return false
    }

    func run() -> Disposable {
        let subscription1 = SingleAssignmentDisposable()
        let subscription2 = SingleAssignmentDisposable()
        let subscription3 = SingleAssignmentDisposable()
        let subscription4 = SingleAssignmentDisposable()
        let subscription5 = SingleAssignmentDisposable()
        let subscription6 = SingleAssignmentDisposable()
        let subscription7 = SingleAssignmentDisposable()

        let observer1 = ZipObserver(lock: _lock, parent: self, index: 0, setNextValue: { self._values1.enqueue($0) }, this: subscription1)
        let observer2 = ZipObserver(lock: _lock, parent: self, index: 1, setNextValue: { self._values2.enqueue($0) }, this: subscription2)
        let observer3 = ZipObserver(lock: _lock, parent: self, index: 2, setNextValue: { self._values3.enqueue($0) }, this: subscription3)
        let observer4 = ZipObserver(lock: _lock, parent: self, index: 3, setNextValue: { self._values4.enqueue($0) }, this: subscription4)
        let observer5 = ZipObserver(lock: _lock, parent: self, index: 4, setNextValue: { self._values5.enqueue($0) }, this: subscription5)
        let observer6 = ZipObserver(lock: _lock, parent: self, index: 5, setNextValue: { self._values6.enqueue($0) }, this: subscription6)
        let observer7 = ZipObserver(lock: _lock, parent: self, index: 6, setNextValue: { self._values7.enqueue($0) }, this: subscription7)

        subscription1.disposable = _parent.source1.subscribe(observer1)
        subscription2.disposable = _parent.source2.subscribe(observer2)
        subscription3.disposable = _parent.source3.subscribe(observer3)
        subscription4.disposable = _parent.source4.subscribe(observer4)
        subscription5.disposable = _parent.source5.subscribe(observer5)
        subscription6.disposable = _parent.source6.subscribe(observer6)
        subscription7.disposable = _parent.source7.subscribe(observer7)

        return Disposables.create([
           subscription1,
           subscription2,
           subscription3,
           subscription4,
           subscription5,
           subscription6,
           subscription7
        ])
    }

    override func getResult() throws -> R {
        return try _parent._resultSelector(_values1.dequeue()!, _values2.dequeue()!, _values3.dequeue()!, _values4.dequeue()!, _values5.dequeue()!, _values6.dequeue()!, _values7.dequeue()!)
    }
}

class Zip7<E1, E2, E3, E4, E5, E6, E7, R> : Producer<R> {
    typealias ResultSelector = (E1, E2, E3, E4, E5, E6, E7) throws -> R

    let source1: Observable<E1>
    let source2: Observable<E2>
    let source3: Observable<E3>
    let source4: Observable<E4>
    let source5: Observable<E5>
    let source6: Observable<E6>
    let source7: Observable<E7>

    let _resultSelector: ResultSelector

    init(source1: Observable<E1>, source2: Observable<E2>, source3: Observable<E3>, source4: Observable<E4>, source5: Observable<E5>, source6: Observable<E6>, source7: Observable<E7>, resultSelector: ResultSelector) {
        self.source1 = source1
        self.source2 = source2
        self.source3 = source3
        self.source4 = source4
        self.source5 = source5
        self.source6 = source6
        self.source7 = source7

        _resultSelector = resultSelector
    }

    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == R {
        let sink = ZipSink7_(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
    }
}



// 8

extension Observable {
    /**
    Merges the specified observable sequences into one observable sequence by using the selector function whenever all of the observable sequences have produced an element at a corresponding index.

    - seealso: [zip operator on reactivex.io](http://reactivex.io/documentation/operators/zip.html)

    - parameter resultSelector: Function to invoke for each series of elements at corresponding indexes in the sources.
    - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
    */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public static func zip<O1: ObservableType, O2: ObservableType, O3: ObservableType, O4: ObservableType, O5: ObservableType, O6: ObservableType, O7: ObservableType, O8: ObservableType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5, _ source6: O6, _ source7: O7, _ source8: O8, resultSelector: @escaping (O1.E, O2.E, O3.E, O4.E, O5.E, O6.E, O7.E, O8.E) throws -> E)
        -> Observable<E> {
        return Zip8(
            source1: source1.asObservable(), source2: source2.asObservable(), source3: source3.asObservable(), source4: source4.asObservable(), source5: source5.asObservable(), source6: source6.asObservable(), source7: source7.asObservable(), source8: source8.asObservable(),
            resultSelector: resultSelector
        )
    }
}

class ZipSink8_<E1, E2, E3, E4, E5, E6, E7, E8, O: ObserverType> : ZipSink<O> {
    typealias R = O.E
    typealias Parent = Zip8<E1, E2, E3, E4, E5, E6, E7, E8, R>

    let _parent: Parent

    var _values1: Queue<E1> = Queue(capacity: 2)
    var _values2: Queue<E2> = Queue(capacity: 2)
    var _values3: Queue<E3> = Queue(capacity: 2)
    var _values4: Queue<E4> = Queue(capacity: 2)
    var _values5: Queue<E5> = Queue(capacity: 2)
    var _values6: Queue<E6> = Queue(capacity: 2)
    var _values7: Queue<E7> = Queue(capacity: 2)
    var _values8: Queue<E8> = Queue(capacity: 2)

    init(parent: Parent, observer: O) {
        _parent = parent
        super.init(arity: 8, observer: observer)
    }

    override func hasElements(_ index: Int) -> Bool {
        switch (index) {
        case 0: return _values1.count > 0
        case 1: return _values2.count > 0
        case 2: return _values3.count > 0
        case 3: return _values4.count > 0
        case 4: return _values5.count > 0
        case 5: return _values6.count > 0
        case 6: return _values7.count > 0
        case 7: return _values8.count > 0

        default:
            rxFatalError("Unhandled case (Function)")
        }

        return false
    }

    func run() -> Disposable {
        let subscription1 = SingleAssignmentDisposable()
        let subscription2 = SingleAssignmentDisposable()
        let subscription3 = SingleAssignmentDisposable()
        let subscription4 = SingleAssignmentDisposable()
        let subscription5 = SingleAssignmentDisposable()
        let subscription6 = SingleAssignmentDisposable()
        let subscription7 = SingleAssignmentDisposable()
        let subscription8 = SingleAssignmentDisposable()

        let observer1 = ZipObserver(lock: _lock, parent: self, index: 0, setNextValue: { self._values1.enqueue($0) }, this: subscription1)
        let observer2 = ZipObserver(lock: _lock, parent: self, index: 1, setNextValue: { self._values2.enqueue($0) }, this: subscription2)
        let observer3 = ZipObserver(lock: _lock, parent: self, index: 2, setNextValue: { self._values3.enqueue($0) }, this: subscription3)
        let observer4 = ZipObserver(lock: _lock, parent: self, index: 3, setNextValue: { self._values4.enqueue($0) }, this: subscription4)
        let observer5 = ZipObserver(lock: _lock, parent: self, index: 4, setNextValue: { self._values5.enqueue($0) }, this: subscription5)
        let observer6 = ZipObserver(lock: _lock, parent: self, index: 5, setNextValue: { self._values6.enqueue($0) }, this: subscription6)
        let observer7 = ZipObserver(lock: _lock, parent: self, index: 6, setNextValue: { self._values7.enqueue($0) }, this: subscription7)
        let observer8 = ZipObserver(lock: _lock, parent: self, index: 7, setNextValue: { self._values8.enqueue($0) }, this: subscription8)

        subscription1.disposable = _parent.source1.subscribe(observer1)
        subscription2.disposable = _parent.source2.subscribe(observer2)
        subscription3.disposable = _parent.source3.subscribe(observer3)
        subscription4.disposable = _parent.source4.subscribe(observer4)
        subscription5.disposable = _parent.source5.subscribe(observer5)
        subscription6.disposable = _parent.source6.subscribe(observer6)
        subscription7.disposable = _parent.source7.subscribe(observer7)
        subscription8.disposable = _parent.source8.subscribe(observer8)

        return Disposables.create([
           subscription1,
           subscription2,
           subscription3,
           subscription4,
           subscription5,
           subscription6,
           subscription7,
           subscription8
        ])
    }

    override func getResult() throws -> R {
        return try _parent._resultSelector(_values1.dequeue()!, _values2.dequeue()!, _values3.dequeue()!, _values4.dequeue()!, _values5.dequeue()!, _values6.dequeue()!, _values7.dequeue()!, _values8.dequeue()!)
    }
}

class Zip8<E1, E2, E3, E4, E5, E6, E7, E8, R> : Producer<R> {
    typealias ResultSelector = (E1, E2, E3, E4, E5, E6, E7, E8) throws -> R

    let source1: Observable<E1>
    let source2: Observable<E2>
    let source3: Observable<E3>
    let source4: Observable<E4>
    let source5: Observable<E5>
    let source6: Observable<E6>
    let source7: Observable<E7>
    let source8: Observable<E8>

    let _resultSelector: ResultSelector

    init(source1: Observable<E1>, source2: Observable<E2>, source3: Observable<E3>, source4: Observable<E4>, source5: Observable<E5>, source6: Observable<E6>, source7: Observable<E7>, source8: Observable<E8>, resultSelector: ResultSelector) {
        self.source1 = source1
        self.source2 = source2
        self.source3 = source3
        self.source4 = source4
        self.source5 = source5
        self.source6 = source6
        self.source7 = source7
        self.source8 = source8

        _resultSelector = resultSelector
    }

    override func run<O: ObserverType>(_ observer: O) -> Disposable where O.E == R {
        let sink = ZipSink8_(parent: self, observer: observer)
        sink.disposable = sink.run()
        return sink
    }
}

