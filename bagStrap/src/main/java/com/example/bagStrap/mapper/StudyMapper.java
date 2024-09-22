package com.example.bagStrap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.bagStrap.model.Item;
import com.example.bagStrap.model.StudyComm;

//
@Mapper
public interface StudyMapper {
	//스터디 커뮤니티 카테고리 타입
	List<StudyComm> selectStuComm(HashMap<String, Object> map);
	//스터디 커뮤니티 리스트 
	List<StudyComm> selectStuCommList(HashMap<String, Object> map);
	//스터디 커뮤니티 컨텐츠 보드
	List<StudyComm> selectStuCommListBoard(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 개수
	int countCommList(HashMap<String, Object> map);
	// 나의 커뮤니티 개시글 개수 
	int countMyCommList(HashMap<String, Object> map);
	// 나의 커뮤니티 댓글 개수 
	int countMycommentList(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 상세보기
	StudyComm selectCommView(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 상세보기 댓글
	List<StudyComm>selectViewComment(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 상세보기 댓글 작성
	void insertViewComment(HashMap<String, Object> map);
	//스터디 커뮤니티 나의 게시글
	List<StudyComm> selectMyComm(HashMap<String, Object> map);
	//스터디 커뮤니티 나의 댓글 
	List<StudyComm> selectMyComment(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 작성하기 카테고리  
	List<StudyComm> selectMyCommCategory(HashMap<String, Object> map);
	//스터디 커뮤니티 게시글 작성 
	void insertComm(HashMap<String, Object> map); 
	// 스터디 커뮤티 게시글 작성 이미지 첨부
	void insertBoardFile(HashMap<String, Object> map);
	// 스터디 커뮤티 게시글 삭제
	void deleteBoard(HashMap<String, Object> map);
	// 스터디 커뮤티 게시글 숨기기
	void updateStatusBoard(HashMap<String, Object> map);
	// 스터디 커뮤니티 게시글 업데이트
	void updateComm(HashMap<String, Object> map);
	// 스터디 커뮤티 게시글 댓글 숨기기
	void updateStatusBoardComment(HashMap<String, Object> map);
	// 스터디 커뮤니티 게시글 댓글 삭제
	void deleteBoardComment(HashMap<String, Object> map);
	// 스터디 커뮤티 게시글 좋아요
	void insertCommLike(HashMap<String, Object> map);
	// 스터디 커뮤니티 게시글 댓글 좋아요
	void insertCommentLike(HashMap<String, Object> map);
	//스터디 커뮤니티 상세보기 좋아요 중복체크  
	StudyComm selectLikeCheck(HashMap<String, Object> map);
	// 스터디 커뮤니티 상세보기 좋아요 삭제
	void deleteCommentLike(HashMap<String, Object> map);
	// 스터디 커뮤니티 조회수
	void updateCommViews(HashMap<String, Object> map);
	// 스터디 커뮤니티 좋아요수 갱신  
	StudyComm selectgetLikeCount(HashMap<String, Object> map);
}
