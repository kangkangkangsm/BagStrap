package com.example.bagStrap.dao;

import java.util.HashMap;

public interface StudyService {
	//스터디 사이드바 커뮤니티 카테고리 타입
	HashMap<String, Object> selectStuComm(HashMap<String, Object> map);
	//스터디 사이드바 나의 게시글 개수
	HashMap<String, Object> sidebarCnt(HashMap<String, Object> map);
	//스터디 커뮤니티 컨텐츠 
	HashMap<String, Object> selectStuCommListBoard(HashMap<String, Object> map);
	//나의 게시글, 댓글 목록
	HashMap<String, Object> myCnt(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 상세보기
	HashMap<String, Object> selectCommView(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 상세보기 댓글작성
	HashMap<String, Object> insertViewComment(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 작성하기 카테고리  
	HashMap<String, Object> selectMyCommCategory(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 작성하기
	HashMap<String, Object> insertComm(HashMap<String, Object> map);	
	//스터디 커뮤니티 게시글 파일업로드
	HashMap<String, Object> addBoardFile(HashMap<String, Object> map);
	// 스터디 커뮤티 게시글 삭제
	HashMap<String, Object> deleteBoard(HashMap<String, Object> map);
	// 스터디 커뮤티 게시글 숨기기
	HashMap<String, Object> updateStatusBoard(HashMap<String, Object> map);
	// 스터디 커뮤니티 업데이트
	HashMap<String, Object> updateComm(HashMap<String, Object> map);
	// 스터디 커뮤티 게시글 댓글 숨기기
	HashMap<String, Object> updateStatusBoardComment(HashMap<String, Object> map);
	// 스터디 커뮤니티 게시글 댓글 삭제
	HashMap<String, Object> deleteBoardComment(HashMap<String, Object> map);
	// 스터디 커뮤티 게시글 좋아요
	HashMap<String, Object> insertCommLike(HashMap<String, Object> map);
	// 스터디 커뮤니티 게시글 댓글 좋아요
	HashMap<String, Object> insertCommentLike(HashMap<String, Object> map);
	//스터디 커뮤니티 상세보기 좋아요 중복체크  
	HashMap<String, Object> selectLikeCheck(HashMap<String, Object> map);
	//스터디 커뮤니티 상세보기 좋아요 삭제
	HashMap<String, Object> deleteCommentLike(HashMap<String, Object> map);
	// 스터디 커뮤니티 좋아요수 갱신  
	HashMap<String, Object> selectgetLikeCount(HashMap<String, Object> map);
	// 스터디 커뮤니티 댓글 수정모드 
	HashMap<String, Object> updateComment(HashMap<String, Object> map);
	// 스터디 커뮤니티 댓글 수정모드 N
	HashMap<String, Object> updateCommentNO(HashMap<String, Object> map);
	// 스터디 커뮤니티 댓글 수정 완료처리
	HashMap<String, Object> updateCommentResult(HashMap<String, Object> map);
	// 스터디 커뮤니티 답글 세트
	HashMap<String, Object> updateCommentRENO(HashMap<String, Object> map);
	// 스터디 커뮤니티 답글 모드
	HashMap<String, Object> updateCommentREY(HashMap<String, Object> map);
	// 스터디 커뮤니티 답글 수정완료처리
	HashMap<String, Object> updateCommentReResult(HashMap<String, Object> map);
}
