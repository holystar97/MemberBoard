package com.javatea.member_project2.domain;

public class PageVO {

	 private int page; // 현재 페이지
	    private int maxPage; // 총 페이지
	    private int startPage; // 시작 페이지
	    private int endPage; // 마지막 페이지
	    private int listCount; // 페이지당 게시글수
		@Override
		public String toString() {
			return String.format("PageVO [page=%s, maxPage=%s, startPage=%s, endPage=%s, listCount=%s]", page, maxPage,
					startPage, endPage, listCount);
		}
		public int getPage() {
			return page;
		}
		public void setPage(int page) {
			this.page = page;
		}
		public int getMaxPage() {
			return maxPage;
		}
		public void setMaxPage(int maxPage) {
			this.maxPage = maxPage;
		}
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public int getEndPage() {
			return endPage;
		}
		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}
		public int getListCount() {
			return listCount;
		}
		public void setListCount(int listCount) {
			this.listCount = listCount;
		}
	
	
}
