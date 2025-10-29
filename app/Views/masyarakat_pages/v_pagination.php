<?php $pager->setSurroundCount(2) ?>
<nav
    class="pagination-container"
    aria-label="Page navigation example">
    <?php if ($pager->hasPrevious()) : ?>
        <a href="<?= $pager->getPrevious() ?>" class="page-link previous">
            <img
                src="./assets-home/assets/icons/angles-left.svg"
                class="svg-inject"
                alt="" />
            Previous
        </a>
    <?php endif ?>
    <ul class="pagination bg-lavender-web-100">
        <?php foreach ($pager->links() as $link): ?>
            <li class="page-item <?= $link['active'] ? 'active' : '' ?>">
                <a class="page-link" href="<?= $link['uri'] ?>">
                    <?= $link['title'] ?>
                </a>
            </li>
        <?php endforeach ?>
    </ul>
    <?php if ($pager->hasNext()) : ?>
        <a href="<?= $pager->getNext() ?>" class="page-link next">
            Next
            <img
                src="./assets-home/assets/icons/angles-right.svg"
                class="svg-inject"
                alt="" />
        </a>
    <?php endif ?>

</nav>