//
//  Coordinator+TabBar.swift
//  XCoordinator
//
//  Created by Paul Kraft on 27.07.18.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

extension UITabBarController {
    func set(_ viewControllers: [UIViewController],
             with options: TransitionOptions,
             animation: Animation?,
             completion: PresentationHandler?) {

        animationDelegate?.animation = animation
        assert(animation == nil || animationDelegate != nil,"""
        Animations do not work, if the tabbar controller's delegate is not a TabBarAnimationDelegate.
        This assertion might fail, if you did not call super.generateRootViewController to generate the tabbar controller
        as a coordinator's rootViewController or you set another delegate on your rootViewController.
        To set another delegate of your rootViewController in a TabBarCoordinator, have a look at `TabBarCoordinator.delegate`.
        """)

        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)

        setViewControllers(viewControllers, animated: options.animated)

        CATransaction.commit()
    }

    func select(_ viewController: UIViewController,
                with options: TransitionOptions,
                animation: Animation?,
                completion: PresentationHandler?) {

        animationDelegate?.animation = animation
        assert(animation == nil || animationDelegate != nil, """
        Animations do not work, if the tabbar controller's delegate is not a TabBarAnimationDelegate.
        This assertion might fail, if you did not call super.generateRootViewController to generate the tabbar controller
        as a coordinator's rootViewController or you set another delegate on your rootViewController.
        To set another delegate of your rootViewController in a TabBarCoordinator, have a look at `TabBarCoordinator.delegate`.
        """)

        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)

        selectedViewController = viewController

        CATransaction.commit()
    }

    func select(index: Int, with options: TransitionOptions, animation: Animation?, completion: PresentationHandler?) {

        animationDelegate?.animation = animation
        assert(animation == nil || animationDelegate != nil, """
        Animations do not work, if the tabbar controller's delegate is not a TabBarAnimationDelegate.
        This assertion might fail, if you did not call super.generateRootViewController to generate the tabbar controller
        as a coordinator's rootViewController or you set another delegate on your rootViewController.
        To set another delegate of your rootViewController in a TabBarCoordinator, have a look at `TabBarCoordinator.delegate`.
        """)

        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)

        selectedIndex = index

        CATransaction.commit()
    }
}
