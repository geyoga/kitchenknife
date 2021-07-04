//
//  OnboardingCollectionViewController.swift
//  KitchenKnife
//
//  Created by Georgius Yoga Dewantama on 04/07/21.
//

import UIKit
import LBTATools
import AnimatedCollectionViewLayout

private typealias `Self` = OnboardingCollectionViewController

protocol OnboardingCollectionDelegate: class {
    func onboardingCollectionViewController(
        _ onboardingCollectionViewController:OnboardingCollectionViewController,
        didScrollAt page: Int
    )
}

class OnboardingCollectionViewController: LBTAListController<OnboardingCell, OnboardingModel> {

    // MARK: - Properties

    let cellId: String = "cellId"
    weak var delegate: OnboardingCollectionDelegate?
    var currentPage: Int = 0
    var isDragging: Bool = false

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = AnimatedCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.animator = PageAttributesAnimator()
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = Asset.Color.black.color
        collectionView.isPagingEnabled = true
    }

    // MARK: - Collection Data Source

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: cellId,
                for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        cell.item = items[indexPath.item]

        return cell
    }
}

// MARK: - Collection View Delegate Flow Layout
extension Self: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return .init(
            width: collectionView.frame.width,
            height: collectionView.frame.height
        )
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0.0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0.0
    }
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDragging = true
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !isDragging { return }
        if items.isEmpty { return }

        let width = scrollView.frame.width - (scrollView.contentInset.left - scrollView.contentInset.right)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = Int(round(index))

        currentPage = roundedIndex
        delegate?.onboardingCollectionViewController(self, didScrollAt: roundedIndex)
    }
}
